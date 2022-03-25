part of 'account_bloc.dart';

abstract class AccountEvent extends Equatable {
  const AccountEvent();

  @override
  List<Object> get props => [];
}

class GetMyAccount extends AccountEvent {
  @override
  List<Object> get props => [];
}

class GetOtherAccounts extends AccountEvent {
  @override
  List<Object> get props => [];
}
