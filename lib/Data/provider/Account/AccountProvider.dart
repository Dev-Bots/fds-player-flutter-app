import 'dart:async';
import 'dart:convert';

// import 'package:dev_player_fds/Data/models/Account.dart';
import 'package:dev_player_fds/data/models/models.dart';
// import 'package:mobile_banking/infrastructure/data_provider/config.dart';
import 'package:http/http.dart' as http;
// import 'package:mobile_banking/infrastructure/data_provider/getToken.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class AccountDataProvider {
  AccountDataProvider({required this.httpClient});

  final http.Client httpClient;

  final _baseUrl = '10.0.2.2:8000';

  Future getAccounts() async {
    final response = await httpClient
        .get(Uri.http(_baseUrl, '/api/users/'), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      // 'token': await getToken()
    });

    if (response.statusCode == 200) {
      final accounts = jsonDecode(response.body);

      return accounts.map((account) => Account.fromJson(account)).toList();
      // return accounts[0]['userName'];
    } else {
      throw Exception('Failed to load accounts');
    }
  }
 Future getCurrentUser() async {
    print('getCurrentUser');
  }
}


  // Future getAccounts() async {
  //   print(_baseUrl);
  //   final response = await httpClient.get(
  //     Uri.http(_baseUrl, '/api/users/'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //       // 'token': await getToken()
  //     },
  //   );

  //   if (response.statusCode == 200) {
  //     var data = jsonDecode(response.body);
  //     print(data);

  //     var accounts = data.map((account) => Account.fromJson(account)).toList();
  //     return accounts;

  // return Account.fromJson(json.decode(data));

  // final acoo = data.map<String>((e) => e['firstName'] as String).toList();

  // print(data.map((e) => e['firstName']));
  // print(data.map((e) => e['lastName']));
  // print(data.map((e) => e['userName']));
  // print(data.map((e) => e['gender']));
  // print(data.map((e) => e['email']));
  // print(data.map((e) => e['phoneNumber']));
  // print(data.map((e) => e['address']));

  //   } else {
  //     throw Exception("Can not find transaction.");
  //   }
  // }