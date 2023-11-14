import 'package:bloc/bloc.dart';

class MyBlocObserver extends BlocObserver {

  @override
  void onCreate(BlocBase<dynamic> bloc) {
    print('RuntimeTypeBloc: ${bloc.runtimeType}');
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    print('RuntimeTypeBloc: ${bloc.runtimeType}');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    print('RuntimeTypeBloc: ${bloc.runtimeType} / ${error.toString()} / ${stackTrace.toString()}');
  }

  @override
  void onTransition(Bloc<dynamic, dynamic> bloc, Transition<dynamic, dynamic> transition) {
    print('RuntimeTypeBloc: ${bloc.runtimeType} / Transition: ${transition.event} / TransitionCurrentState: ${transition.currentState} / TransitionNextState: ${transition.nextState}');
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    print('RuntimeTypeBloc: ${bloc.runtimeType} / ChangeCurrentState: ${change.currentState} / ChangeNextState: ${change.nextState}');
  }

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    print('RuntimeTypeBloc: ${bloc.runtimeType} / ${event.runtimeType}');
  }
}