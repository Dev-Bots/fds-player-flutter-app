part of 'account_bloc.dart';

abstract class AccountState extends Equatable {
  const AccountState();

  @override
  List<Object> get props => [];
}

class AccountInitial extends AccountState {}

class AccountLoading extends AccountState {}

class AccountLoaded extends AccountState {
  final user;

  const AccountLoaded({required this.user});
  @override
  List<Object> get props => [user];
}

class AccountFailed extends AccountState {
  final String error;

  const AccountFailed({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'AccountFailure { error: $error }';
}
