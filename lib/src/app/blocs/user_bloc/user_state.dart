part of 'user_bloc.dart';

class UserState extends Equatable {
  final User? user;
  final StateStatus status;

  const UserState({
    this.user,
    this.status = StateStatus.loading,
  });

  UserState copyWith({
    User? user,
    StateStatus? status,
  }) =>
      UserState(
        user: user ?? this.user,
        status: status ?? this.status,
      );

  @override
  List<Object?> get props => [user, status];
}
