import 'package:dev_player_fds/Data/models/models.dart';
import 'package:dev_player_fds/Data/provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class AccountRepository {
  final AccountDataProvider accountDataProvider = AccountDataProvider();

  AccountRepository();

  Future getCurrentUser() async {
    final prefs = await SharedPreferences.getInstance();

    final user = prefs.getString('user');

    final id = jsonDecode((prefs.getString('user')).toString())['id'];
    print('REPOOOOOOOO' + (id).toString());

    return await accountDataProvider.getCurrentUser(id);
  }

  Future getLocalAccount() async {
    return await accountDataProvider.getLocalAccount();
  }
}
