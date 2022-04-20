import 'package:bloc/bloc.dart';
import 'package:dev_player_fds/Data/repository/repository.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final AccountRepository accountRepository = AccountRepository();

  final prefs = SharedPreferences.getInstance();

  AccountBloc() : super(AccountLoading()) {
    on<GetMyAccount>((event, emit) async {
      emit(AccountLoading());
      var user = await accountRepository.getCurrentUser();

      if (user != null) {
        emit(AccountLoaded(user: user));
      } else {
        emit(const AccountFailed(error: "Failed to load."));
      }
    });
    on<GetMyLocalAccount>((event, emit) async {
      emit(AccountLocalLoading());
      var user = await accountRepository.getLocalAccount();
      if (user != null) {
        emit(AccountLocalLoaded(user: user));
      } else {
        emit(const AccountLocalFailed(error: "Failed to load."));
      }
    });
  }
}
