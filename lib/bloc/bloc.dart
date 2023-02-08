import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_provider_todo_list/bloc/todo_event.dart';
import 'package:flutter_provider_todo_list/bloc/todo_state.dart';

class TaskBloc extends Bloc<TodoEvent, TodoState> {
  TaskBloc() : super(const TodoState()) {
    on<AddTodoEvent>((event, emit) {
      emit(TodoState(tasks: [...state.tasks, event.task]));
    });
    on<DeleteTodoEvent>((event, emit) {
      state.tasks.removeAt(event.index);
      emit(TodoState(tasks: state.tasks));
    });
  }

  TodoState get initialState => const TodoState();

  @override
  Stream<TodoState> mapEventToState(TodoEvent event) async* {
    if (event is AddTodoEvent) {
      yield TodoState(tasks: [...state.tasks, event.task]);
    } else if (event is DeleteTodoEvent) {
      state.tasks.removeAt(event.index);
      yield TodoState(tasks: state.tasks);
    }
  }
}
