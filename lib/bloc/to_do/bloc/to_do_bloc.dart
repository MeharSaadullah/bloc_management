import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'to_do_event.dart';
part 'to_do_state.dart';

class ToDoBloc extends Bloc<ToDoEvent, ToDoState> {
  final List<String> todoList =
      []; // here we add this list bcz we are updating the data in list foam
  ToDoBloc() : super(ToDoState()) {
    on<AddTodoEvent>(_addtoDoEvent);
    on<DeleteTodoEvent>(_deletetoDoEvent);
    // on<ToDoEvent>((event, emit) {
    //   // TODO: implement event handler
    // });
  }
  void _addtoDoEvent(AddTodoEvent event, Emitter<ToDoState> emit) {
    todoList.add(event.task);
    emit(state.copyWith(todoList: List.from(todoList)));
  }

  void _deletetoDoEvent(DeleteTodoEvent event, Emitter<ToDoState> emit) {
    todoList.remove(event.task);
    emit(state.copyWith(todoList: List.from(todoList)));
  }
}
