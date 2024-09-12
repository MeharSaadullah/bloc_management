import 'package:bloc_management/bloc/to_do/bloc/to_do_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To Do Screen"),
      ),
// list view use for scroll
      body: BlocBuilder<ToDoBloc, ToDoState>(
        builder: (context, state) {
          if (state.todolist.isEmpty) {
            return const Center(
                child: Text(
              " No ToDo List Found",
              style: TextStyle(fontSize: 20),
            ));
          } else if (state.todolist.isNotEmpty) {
            return ListView.builder(
                itemCount: state.todolist.length,
                itemBuilder: (context, index) {
                  // list tile use represent  a single fixed-height row that typically contains some text as well as leading and trailing icons or widgets. I
                  return ListTile(
                    //  title: Text(index.toString()),
                    title: Text(state.todolist[index]),
                    trailing: IconButton(
                        onPressed: () {
                          context.read<ToDoBloc>().add(
                              DeleteTodoEvent(task: state.todolist[index]));
                        },
                        icon: const Icon(Icons.delete)),
                  );
                });
          } else {
            return const SizedBox();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          for (int i = 0; i < 20; i++) {
            context
                .read<ToDoBloc>()
                .add(AddTodoEvent(task: 'saad: ' + i.toString()));
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
