part of 'to_do_bloc.dart';

abstract class ToDoEvent extends Equatable {
  const ToDoEvent();
}

//abstract
class AddTodoEvent extends ToDoEvent {
  final String task; // here we add this bcz we r getting list(data) from user
  const AddTodoEvent({required this.task});

  List<Object> get props => [task];
}

class DeleteTodoEvent extends ToDoEvent {
  final Object task;
  const DeleteTodoEvent({required this.task});

  List<Object> get props => [task];
}
