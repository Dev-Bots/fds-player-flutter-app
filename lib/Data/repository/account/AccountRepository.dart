
import 'package:dev_player_fds/Data/models/models.dart';
import 'package:dev_player_fds/Data/provider/Account/AccountProvider.dart';
import 'package:dev_player_fds/Data/provider/provider.dart';

class AccountRepository {
  final AccountDataProvider accountDataProvider;

  AccountRepository({required this.accountDataProvider});

  Future getAllAccounts()