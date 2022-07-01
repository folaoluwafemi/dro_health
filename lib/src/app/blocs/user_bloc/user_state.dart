part of 'user_bloc.dart';

class UserState extends Equatable {
  final User? user;
  final StateStatus status;
  int count;

  UserState({
    this.user,
    this.status = StateStatus.loading,
    this.count = 0,
  }) {
    count = user?.cart.length ?? 0;
  }

  UserState copyWith({
    User? user,
    StateStatus? status,
  }) {
    int? count = user?.cart.length;
    return UserState(
      user: user ?? this.user,
      count: count ?? this.count,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [user, status, count];
}
