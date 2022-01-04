// ignore_for_file: avoid_print
import 'package:bloc/bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    //print("***** EVENT *****");
    //print(event);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    //print(error);
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    //print("***** CHANGE CURRENT *****");
    //print(change.currentState);
    //print("***** CHANGE NEXT *****");
    //print(change.nextState);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    //print("***** TRANS CURRENT *****");
    //print(transition.currentState);
    //print("***** TRANS NEXT *****");
    //print(transition.nextState);
  }
}
