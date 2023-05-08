import 'package:bloc/bloc.dart';

class CountCubit extends Cubit<int> {
  // CountCubit(super.initialState);
  CountCubit() : super(0);

  void addCount() {
    emit(state + 1);
  }

  void substractCount() {
    emit(state - 1);
  }
}
