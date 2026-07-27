class TodoDto {
  final int id;
  final String title;
  final bool completed;

  const TodoDto({
    required this.id,
    required this.title,
    required this.completed,
  });

  bool get pendiente => !completed;

  factory TodoDto.fromJson(Map<String, dynamic> json) => TodoDto(
    id:        json['id']        as int,
    title:     json['title']     as String,
    completed: json['completed'] as bool,
  );
}