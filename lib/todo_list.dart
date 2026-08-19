import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/cubit/todo_cubit.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    final todoCubit = BlocProvider.of<TodoCubit>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Todo List')),
      body: BlocBuilder<TodoCubit, List<String>>(
        builder: (context, todoList) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: todoList.length,
                  itemBuilder: (context, index) {
                    return Text(todoList[index]);
                  },
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: 5,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, '/add-todo');
            },
            tooltip: 'Add Todo',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              todoCubit.todoRemove();
            },
            tooltip: 'Remove Todo',
            child: const Icon(Icons.remove_circle_outline),
          ),
        ],
      ),
    );
  }
}
