import 'dart:convert';

import 'package:http/http.dart' as http;

//fazendo requisições
Future main() async {
  final json = await fetch();
  print(json); //retorna um campo do json
}

Future fetch() async {
  var url = 'https://jsonplaceholder.typicode.com/todos/1';
  var response = await http.get(Uri.parse(url));
  var json = jsonDecode(response.body);
  return json;
}
