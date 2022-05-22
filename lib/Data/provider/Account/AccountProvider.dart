import 'dart:async';
import 'dart:convert';
import 'package:dev_player_fds/Data/models/Account/Account.dart';
import 'package:dev_player_fds/Data/provider/config/config.dart';
import 'package:dev_player_fds/Data/models/models.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:mobile_banking/infrastructure/data_provider/getToken.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class AccountDataProvider {
  AccountDataProvider();

  final http.Client httpClient = http.Client();

  final _baseUrl = baseURL;

  Future getCurrentUser(id) async {
    try {
      final response =
          await httpClient.get(Uri.http(_baseUrl, '/api/players/$id/'));

      if (response.statusCode == 200) {
        final account = jsonDecode(response.body);
        return Account.fromJson(account);

        // return accounts.map((account) => Account.fromJson(account)).toList();
        // return accounts[0]['userName'];
      } else if (response.statusCode == 400) {
        print('400 Error');
      }
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }

  Future getLocalAccount() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final user = prefs.getString('user');
      if (user != null) {
        print('SUCESS MAYBEEEEEEEEEEEEEEEEEEEEE?');

        return Account.fromJson(jsonDecode(user));
      }
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }
}
