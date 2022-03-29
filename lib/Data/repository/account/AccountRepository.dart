
import 'package:dev_player_fds/Data/models/models.dart';
import 'package:dev_player_fds/Data/provider/Account/AccountProvider.dart';
import 'package:dev_player_fds/Data/provider/provider.dart';

class AccountRepository {
  final AccountDataProvider accountDataProvider;

  AccountRepository({required this.accountDataProvider});

  Future getAllAccounts() async {
    return await accountDataProvider.getAccounts();
  }
  // Future getAllAccounts() async {
  //   Account data = await accountDataProvider.getAccounts();
  //   List accountJsonList = data.props; // data.props is a list of json objects
  //   var accounts =
  //       accountJsonList.map((account) => Account.fromJson(account)).toList();
  //   return accounts;
  // }

  Future getCurrentUser() async {
    return await accountDataProvider.getCurrentUser();
  }
}
