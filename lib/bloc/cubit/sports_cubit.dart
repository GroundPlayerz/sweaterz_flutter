import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sweaterz_flutter/bloc/state/sports_state.dart';
import 'package:sweaterz_flutter/model/sports/sports.dart';
import 'package:sweaterz_flutter/repository/sports_repository.dart';

class SportsCubit extends Cubit<SportsState> {
  final SportsRepository repository;

  SportsCubit({required this.repository}) : super(Empty());

  getAllSports() async {
    try {
      emit(Loading());

      final resp = await this.repository.getAllSports();
      final decodedResp = jsonDecode(resp.data);

      final sportsList = decodedResp
          .map<Sports>(
            (e) => Sports.fromJson(e),
          )
          .toList();

      emit(Loaded(sportsList: sportsList));
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }

  // createTodo(String title) async {
  //   try {
  //     if (state is Loaded) {
  //       final parsedState = (state as Loaded);
  //
  //       final newTodo = Todo(
  //         id: parsedState.todos[parsedState.todos.length - 1].id + 1,
  //         title: title,
  //         createdAt: DateTime.now().toString(),
  //       );
  //
  //       final prevTodos = [
  //         ...parsedState.todos,
  //       ];
  //
  //       final newTodos = [
  //         ...prevTodos,
  //         newTodo,
  //       ];
  //
  //       emit(Loaded(todos: newTodos));
  //
  //       final resp = await this.repository.createTodo(newTodo);
  //
  //       emit(
  //         Loaded(
  //           todos: [
  //             ...prevTodos,
  //             Todo.fromJson(resp),
  //           ],
  //         ),
  //       );
  //     }
  //   } catch (e) {
  //     emit(Error(message: e.toString()));
  //   }
  // }
  //
  // deleteTodo(Todo todo) async {
  //   try {
  //     if (state is Loaded) {
  //       final newTodos = (state as Loaded)
  //           .todos
  //           .where((item) => item.id != todo.id)
  //           .toList();
  //
  //       emit(Loaded(todos: newTodos));
  //
  //       await repository.deleteTodo(todo);
  //     }
  //   } catch (e) {
  //     emit(Error(message: e.toString()));
  //   }
  // }
}
