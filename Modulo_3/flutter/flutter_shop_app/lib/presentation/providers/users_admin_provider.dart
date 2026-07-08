// lib/presentation/providers/users_admin_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/remote/api/user_remote_datasource.dart';
import '../../domain/model/user.dart';

enum UserRoleFilter { all, clients, staff, active, inactive }

extension UserRoleFilterLabel on UserRoleFilter {
  String get label => switch (this) {
    UserRoleFilter.all      => 'Todos',
    UserRoleFilter.clients  => 'Clientes',
    UserRoleFilter.staff    => 'Staff',
    UserRoleFilter.active   => 'Activos',
    UserRoleFilter.inactive => 'Inactivos',
  };
}

// ── Estados del formulario ───────────────────────────────────────
sealed class UserFormState { const UserFormState(); }
class UserFormIdle    extends UserFormState { const UserFormIdle(); }
class UserFormSaving  extends UserFormState { const UserFormSaving(); }
class UserFormSuccess extends UserFormState {
  final String message;
  const UserFormSuccess(this.message);
}
class UserFormError extends UserFormState {
  final String message;
  const UserFormError(this.message);
}

// ── Estado principal ─────────────────────────────────────────────
class UsersAdminState {
  final List<User>     users;
  final bool           isLoading;
  final bool           isLoadingMore;
  final String?        error;
  final int            total;
  final bool           hasMore;
  final String         search;
  final UserRoleFilter roleFilter;
  final UserFormState  formState;
  final int            page;

  const UsersAdminState({
    this.users          = const [],
    this.isLoading      = false,
    this.isLoadingMore  = false,
    this.error,
    this.total          = 0,
    this.hasMore        = false,
    this.search         = '',
    this.roleFilter     = UserRoleFilter.all,
    this.formState      = const UserFormIdle(),
    this.page           = 1,
  });

  List<User> get filtered => users;

  UsersAdminState copyWith({
    List<User>?    users,
    bool?          isLoading,
    bool?          isLoadingMore,
    String?        error,
    int?           total,
    bool?          hasMore,
    String?        search,
    UserRoleFilter? roleFilter,
    UserFormState?  formState,
    int?           page,
  }) => UsersAdminState(
    users:          users          ?? this.users,
    isLoading:      isLoading      ?? this.isLoading,
    isLoadingMore:  isLoadingMore  ?? this.isLoadingMore,
    error:          error,
    total:          total          ?? this.total,
    hasMore:        hasMore        ?? this.hasMore,
    search:         search         ?? this.search,
    roleFilter:     roleFilter     ?? this.roleFilter,
    formState:      formState      ?? this.formState,
    page:           page           ?? this.page,
  );
}

// ── Notifier ─────────────────────────────────────────────────────
class UsersAdminNotifier extends StateNotifier<UsersAdminState> {
  final UserRemoteDatasource _datasource;

  UsersAdminNotifier(this._datasource) : super(const UsersAdminState()) {
    load();
  }

  Future<void> load({bool reset = true}) async {
    final s    = state;
    final page = reset ? 1 : s.page;

    if (reset) {
      state = s.copyWith(isLoading: true, error: null, page: 1);
    } else {
      if (s.isLoadingMore || !s.hasMore) return;
      state = s.copyWith(isLoadingMore: true);
    }

    try {
      final isStaffFilter = switch (s.roleFilter) {
        UserRoleFilter.staff => true,
        UserRoleFilter.clients => false,
        _ => null,
      };
      final isActiveFilter = switch (s.roleFilter) {
        UserRoleFilter.active => true,
        UserRoleFilter.inactive => false,
        _ => null,
      };

      final result = await _datasource.getUsers(
        page:     page,
        pageSize: 20,
        search:   s.search.isEmpty ? null : s.search,
        isStaff:  isStaffFilter,
        isActive: isActiveFilter,
      );

      state = state.copyWith(
        users:         reset ? result.results : [...state.users, ...result.results],
        total:         result.count,
        hasMore:       result.next != null,
        isLoading:     false,
        isLoadingMore: false,
        page:          page + 1,
        error:         null,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading:     false,
        isLoadingMore: false,
        error:         e.toString().replaceAll('Exception: ', ''),
      );
    }
  }

  void setSearch(String q) {
    state = state.copyWith(search: q);
    load();
  }

  void setRoleFilter(UserRoleFilter f) {
    state = state.copyWith(roleFilter: f);
    load();
  }

  void loadMore() => load(reset: false);
  void refresh()  => load();
  void resetFormState()                => state = state.copyWith(formState: const UserFormIdle());

  // Toggle staff — optimista
  void toggleStaff(int id, bool isStaff) {
    state = state.copyWith(
      users: state.users.map((u) =>
        u.id == id ? u.copyWith(isStaff: isStaff) : u,
      ).toList(),
    );
    _doToggleStaff(id, isStaff);
  }

  Future<void> _doToggleStaff(int id, bool isStaff) async {
    final user = state.users.firstWhere((u) => u.id == id);
    try {
      await _datasource.updateUser(id, {
        ...user.toJson(),
        'is_staff': isStaff,
      });
    } catch (_) {
      // revertir si falla
      state = state.copyWith(
        users: state.users.map((u) =>
          u.id == id ? u.copyWith(isStaff: !isStaff) : u,
        ).toList(),
      );
    }
  }

  // Toggle activo — optimista con confirmación del servidor
  void toggleActive(int id) {
    final user = state.users.firstWhere((u) => u.id == id);
    final next = !user.isActive;
    state = state.copyWith(
      users: state.users.map((u) =>
        u.id == id ? u.copyWith(isActive: next) : u,
      ).toList(),
    );
    _datasource.toggleActive(id).then((serverActive) {
      state = state.copyWith(
        users: state.users.map((u) =>
          u.id == id ? u.copyWith(isActive: serverActive) : u,
        ).toList(),
      );
    }).catchError((_) {
      state = state.copyWith(
        users: state.users.map((u) =>
          u.id == id ? u.copyWith(isActive: !next) : u,
        ).toList(),
      );
    });
  }

  Future<void> createUser(Map<String, dynamic> payload) async {
    state = state.copyWith(formState: const UserFormSaving());
    try {
      final created = await _datasource.createUser(payload);
      state = state.copyWith(
        users:     [created, ...state.users],
        total:     state.total + 1,
        formState: const UserFormSuccess('Usuario creado'),
      );
    } catch (e) {
      state = state.copyWith(
        formState: UserFormError(e.toString().replaceAll('Exception: ', '')),
      );
    }
  }

  Future<void> updateUser(int id, Map<String, dynamic> payload) async {
    state = state.copyWith(formState: const UserFormSaving());
    try {
      final updated = await _datasource.updateUser(id, payload);
      state = state.copyWith(
        users:     state.users.map((u) => u.id == id ? updated : u).toList(),
        formState: const UserFormSuccess('Usuario actualizado'),
      );
    } catch (e) {
      state = state.copyWith(
        formState: UserFormError(e.toString().replaceAll('Exception: ', '')),
      );
    }
  }

  Future<void> deleteUser(int id) async {
    try {
      await _datasource.deleteUser(id);
      state = state.copyWith(
        users: state.users.where((u) => u.id != id).toList(),
        total: state.total - 1,
      );
    } catch (e) {
      state = state.copyWith(error: e.toString().replaceAll('Exception: ', ''));
    }
  }
}

final usersAdminProvider =
    StateNotifierProvider<UsersAdminNotifier, UsersAdminState>((ref) {
  return UsersAdminNotifier(ref.watch(userDatasourceProvider));
});
