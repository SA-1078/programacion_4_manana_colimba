import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

import 'user_dto.dart';

class PantallaPaso2ListaUsusarios extends StatelessWidget {
  const PantallaPaso2ListaUsusarios({super.key});

  Future<List<UserDto>> _fetchUsers() async {
    final res = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users'),
    );
    final lista = jsonDecode(res.body) as List<dynamic>;
    return lista
        .map((e) => UserDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paso 2 · Usuarios DTO'),
        leading: BackButton(onPressed: () => context.go('/')),
      ),
      body: FutureBuilder<List<UserDto>>(
        future: _fetchUsers(),
        builder: (context, snap) {
          if (snap.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snap.hasError) {
            return Center(child: Text('Error: ${snap.error}'));
          }

          final users = snap.data!;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Resumen con chips
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Chip(
                      avatar: const Icon(Icons.people, size: 16, color: Colors.white),
                      label: Text('${users.length} usuarios'),
                      backgroundColor: const Color.fromARGB(255, 33, 150, 243),
                      labelStyle: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  'Lista de Usuarios:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Lista de usuarios
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  itemCount: users.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, i) {
                    final u = users[i];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: const Color.fromARGB(255, 33, 150, 243).withOpacity(0.2),
                        child: Text(
                          u.name.isNotEmpty ? u.name[0].toUpperCase() : 'U',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 33, 150, 243),
                          ),
                        ),
                      ),
                      title: Text(
                        u.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(Icons.email_outlined, size: 14, color: Colors.grey),
                              const SizedBox(width: 4),
                              Expanded(child: Text(u.email)),
                            ],
                          ),
                          const SizedBox(height: 2),
                          Row(
                            children: [
                              const Icon(Icons.language, size: 14, color: Colors.grey),
                              const SizedBox(width: 4),
                              Expanded(child: Text(u.website)),
                            ],
                          ),
                        ],
                      ),
                      trailing: Chip(
                        label: Text('ID: ${u.id}'),
                        visualDensity: VisualDensity.compact,
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}