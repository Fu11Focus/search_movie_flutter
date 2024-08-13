import 'package:flutter_bloc/flutter_bloc.dart';

// События для блока
abstract class TypeMovieEvent {}

class SelectMovieType extends TypeMovieEvent {
  final String type;

  SelectMovieType(this.type);
}

// Состояние блока
class TypeMovieBloc extends Bloc<TypeMovieEvent, String> {
  TypeMovieBloc() : super('') {
    // Обработка события SelectMovieType
    on<SelectMovieType>((event, emit) {
      emit(event.type);
    });
  }
}
