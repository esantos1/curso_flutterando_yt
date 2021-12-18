import 'package:flutter/material.dart';
import 'package:todolist/src/controllers/home_controller.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = HomeController();
  _success() {
    return ListView.builder(
      itemCount: controller.todos.length,
      itemBuilder: (context, i) {
        var todo = controller.todos[i];
        return ListTile(
          leading: Checkbox(
            onChanged: (value) {},
            value: todo.completed,
          ),
          title: Text(todo.title),
        );
      },
    );
  }

  _error() {
    return Center(
      child: ElevatedButton(
        onPressed: () => controller.start(),
        child: const Text('Tentar novamente'),
      ),
    );
  }

  _loading() {
    return const Center(child: CircularProgressIndicator());
  }

  _start() {
    return Container();
  }

  _stateManagement(HomeState state) {
    switch (state) {
      case HomeState.start:
        return _start();
      case HomeState.loading:
        return _loading();
      case HomeState.sucess:
        return _success();
      case HomeState.error:
        return _error();
      default:
        return _start();
    }
  }

  @override
  void initState() {
    super.initState();
    controller.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Todo\'s'),
        actions: [
          IconButton(
            onPressed: () => controller.start(),
            icon: const Icon(Icons.refresh_outlined),
          ),
        ],
      ),
      body: AnimatedBuilder(
        animation: controller.state,
        builder: (context, child) {
          return _stateManagement(controller.state.value);
        },
      ),
    );
  }
}
