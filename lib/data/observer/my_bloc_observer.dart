import 'package:bloc/bloc.dart';

class MyBlocObserver extends BlocObserver {

  @override
  void onCreate(BlocBase<dynamic> bloc) {
    super.onCreate(bloc);
    print('onCreate RuntimeTypeBloc: ${bloc.runtimeType}');
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    super.onClose(bloc);
    print('onClose RuntimeTypeBloc: ${bloc.runtimeType}');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    print('onError RuntimeTypeBloc: ${bloc.runtimeType} /'
        ' Error: ${error.toString()} /'
        ' StackTrace: ${stackTrace.toString()}');
  }

  @override
  void onTransition(Bloc<dynamic, dynamic> bloc, Transition<dynamic, dynamic> transition) {
    super.onTransition(bloc, transition);
    print('onTransition RuntimeTypeBloc: ${bloc.runtimeType} /'
        ' TransitionEvent: ${transition.event.runtimeType} /'
        ' TransitionCurrentState: ${transition.currentState.runtimeType} /'
        ' TransitionNextState: ${transition.nextState.runtimeType}');
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    print('onChange RuntimeTypeBloc: ${bloc.runtimeType} /'
        ' ChangeCurrentState: ${change.currentState.runtimeType} /'
        ' ChangeNextState: ${change.nextState.runtimeType}');
  }

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    super.onEvent(bloc, event);
    print('onEvent RuntimeTypeBloc: ${bloc.runtimeType} /'
        ' Event: ${event.runtimeType}');
  }
}