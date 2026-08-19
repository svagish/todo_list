import 'package:flutter_bloc/flutter_bloc.dart';

class TodoCubit extends Cubit<List<String>> {
  TodoCubit() : super([]);

  // Add
  void todoAdd(String text) {
    final updatedList = List<String>.from(state);
    updatedList.add(text);
    emit(updatedList);
  }

  // Remove
  void todoRemove() {
    if (state.isEmpty) return;
    final updatedList = List<String>.from(state);
    updatedList.removeLast();
    emit(updatedList);
  }
}
