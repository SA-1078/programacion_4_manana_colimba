import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

import 'todo_dto.dart';

class PantallaPaso2 extends StatelessWidget {
  const PantallaPaso2({super.key});

  Future<List<TodoDto>> _fetchTodos() async {
    final res = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/todos?_limit=15'),
    );
    final lista = jsonDecode(res.body) as List<dynamic>;
    return lista
        .map((e) => TodoDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paso 2 · DTO simple'),
        leading: BackButton(onPressed: () => context.go('/')),
      ),
      body: FutureBuilder<List<TodoDto>>(
        future: _fetchTodos(),
        builder: (context, snap) {
          if (snap.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snap.hasError) {
            return Center(child: Text('Error: ${snap.error}'));
          }

          final todos = snap.data!;
          final pendientes = todos.where((t) => t.pendiente).toList();
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Resumen con chips
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Chip(
                      label: Text(
                          '${todos.where((t) => t.completed).length} completadas'),
                      backgroundColor: const Color.fromARGB(255, 4, 224, 12),
                    ),
                    const SizedBox(width: 8),
                    Chip(
                      label: Text(
                          '${todos.where((t) => t.pendiente).length} pendientes'),
                      backgroundColor: const Color.fromARGB(255, 200, 235, 3),
                    ),
                    const SizedBox(width: 8),
                    Chip(
                      label: Text(
                          '${todos.where((t) => t.title.length > 30).length} >30 carac.'),
                      backgroundColor: const Color.fromARGB(255, 3, 169, 244),
                    ),
                  ],
                ),
              ),
              // Texto indicador
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  'Tareas pendientes:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Lista de todos
              Expanded(
                child: ListView.builder(
                  itemCount: pendientes.length,
                  itemBuilder: (context, i) {
                    final t = pendientes[i];
                    return CheckboxListTile(
                      title: Text(t.title),
                      subtitle: Text('ID: ${t.id}'),
                      value: t.completed,
                      onChanged: null, // solo lectura por ahora
                      activeColor: const Color.fromARGB(255, 28, 8, 216),
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