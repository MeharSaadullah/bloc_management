part of 'to_do_bloc.dart';

class ToDoState extends Equatable {
  final List<String>
      todolist; // here we add list bcz our data was add or remove from list
  // todo list is the name of list
  const ToDoState({this.todolist = const [] // here we initlize empty list

      });

  // copywith function comes from Equitable
  ToDoState copyWith({List<String>? todoList}) {
    return ToDoState(todolist: todoList ?? this.todolist);
  }

  @override
  List<Object> get props => [todolist];
}

final class ToDoInitial extends ToDoState {}
