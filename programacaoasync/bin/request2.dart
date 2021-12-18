//mapeando um json pra um objeto dart

import 'dart:convert';

import 'package:http/http.dart' as http;

//fazendo requisições
Future main() async {
  final todo = await fetch();
  print(todo.toJson()); //retorna um campo do json
}

Future<Todo> fetch() async {
  var url = 'https://jsonplaceholder.typicode.com/todos/1';
  var response = await http.get(Uri.parse(url));
  var json = jsonDecode(response.body);
  var todo = Todo.fromJson(json);
  return todo;
}

class Todo {
  final String title;
  final int id, userId;
  final bool completed;

  //construtor para a classe todo
  Todo({
    required this.title,
    required this.id,
    required this.userId,
    required this.completed,
  });

  //pega os dados do json
  factory Todo.fromJson(Map json) {
    return Todo(
      title: json['title'],
      id: json['id'],
      userId: json['userId'],
      completed: json['completed'],
    );
  }

  //converte os dados em json
  Map toJson() {
    return {
      'title': title,
      'id': id,
      'userId': userId,
      'completed': completed,
    };
  }
}
