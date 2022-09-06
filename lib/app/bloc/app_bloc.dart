import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(
          authenticationRepository.currentUser.isNotEmpty
              ? AppState.authenticated(authenticationRepository.currentUser)
              : const AppState.unauthenticated(),
        ) {
    _userSubscription = _authenticationRepository.user.listen(_onUserChanged);

    on<AppUserChanged>((event, emit) {
      emit(_mapUserChangedToState(event, state));
    });
    on<AppLogoutRequested>((event, emit) {
      unawaited(_authenticationRepository.logOut());
    });
  }

  final AuthenticationRepository _authenticationRepository;
  late final StreamSubscription<User?> _userSubscription;

  void _onUserChanged(User? user) => add(AppUserChanged(user!));

  // @override
  // Stream<AppState> mapEventToState(AppEvent event) async* {
  //   if (event is AppUserChanged) {
  //     yield _mapUserChangedToState(event, state);
  //   } else if (event is AppLogoutRequested) {
  //     unawaited(_authenticationRepository.logOut());
  //   }
  // }

  AppState _mapUserChangedToState(AppUserChanged event, AppState state) {
    return event.user.isNotEmpty
        ? AppState.authenticated(event.user)
        : const AppState.unauthenticated();
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
