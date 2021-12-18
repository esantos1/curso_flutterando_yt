import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todolist/src/controllers/home_controller.dart';
import 'package:todolist/src/models/todo_model.dart';
import 'package:todolist/src/repositories/todo_repository.dart';

class TodoRepositoryMock extends Mock implements TodoRepository {}

void main() {
  final repository = TodoRepositoryMock();
  final controller = HomeController();

  // test('deve preencher a variável todos', () async {
  //   when(repository.fetchTodos())
  //       .thenAnswer((realInvocation) async => [TodoModel()]);

  //   expect(controller.state, HomeState.start);
  //   await controller.start();
  //   expect(controller.state, HomeState.sucess);
  //   expect(controller.todos.isNotEmpty, true);
  // });
  test('deve modificar o estado para erro se a requisição falhar', () async {
    when(repository.fetchTodos()).thenThrow(Exception());

    expect(controller.state, HomeState.start);
    await controller.start();
    expect(controller.state, HomeState.error);
  });
}
