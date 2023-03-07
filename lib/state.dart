class AppState {
  final dynamic user;

  AppState({
    required this.user,
  });

  factory AppState.initialState() => AppState(user: null);

  AppState copyWith({dynamic user}) {
    return AppState(
      user: user ?? this.user,
    );
  }
}

class SetUserAction {
  final dynamic payload;
  SetUserAction(this.payload);
}

AppState appReducer(AppState state, dynamic action) {
  if (action is SetUserAction) {
    return state.copyWith(user: action.payload);
  }
  return state;
}
