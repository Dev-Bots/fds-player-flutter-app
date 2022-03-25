import 'package:bloc/bloc.dart';
import 'package:dev_player_fds/Data/repository/repository.dart';
import 'package:equatable/equatable.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final AccountRepository _accountRepository;

  AccountBloc(this._accountRepository) : super(AccountLoading()) {
    on<GetMyAccount>((event, emit) async {
      print('event dispatched');
      var user = await _accountRepository.getAllAccounts();
      print('returned here');
      if (user != null) {
        print('user is not null');
        emit(AccountLoaded(user: user));
      } else {
        emit(const AccountFailed(error: "Failed to load."));
      }
    });
    on<GetOtherAccounts>((event, emit) async {
      var user = await _accountRepository.getCurrentUser();
      if (user != null) {
        emit(AccountLoaded(user: user));
      } else {
        emit(const AccountFailed(error: "Failed to load."));
      }
    });
  }
}
