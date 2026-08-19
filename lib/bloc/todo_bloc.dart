import 'package:flutter_bloc/flutter_bloc.dart';

// Events super class
sealed class TodoEvents {}
final class TodoEventAdd extends TodoEvents {
  final String text;
  TodoEventAdd(this.text);
}
final class TodoEventRemove extends TodoEvents {}

class TodoBloc extends Bloc<TodoEvents, List<String>> {
  TodoBloc() : super([]){
    on<TodoEventAdd>(
      (event, emit) {
        List<String> updatedList = List<String>.from(state);
        updatedList.add(event.text);
        emit(updatedList);
      }
    );

    on<TodoEventRemove>(
      (event, emit) {
        List<String> updatedList = List<String>.from(state);
        updatedList.removeLast();
        emit(updatedList);
      }
    );
  }
}
