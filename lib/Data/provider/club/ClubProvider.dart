import 'dart:async';
import 'dart:convert';
import 'package:dev_player_fds/Data/models/models.dart';
import 'package:dev_player_fds/Data/provider/config/config.dart';
import 'package:dev_player_fds/Data/provider/interceptors/interceptors.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/http.dart';

class ClubDataProvider {
  ClubDataProvider();

  final _baseUrl = baseURL;

  final httpClient = InterceptedHttp.build(interceptors: [
    Interceptors(),
  ], retryPolicy: ExpiredTokenRetryPolicy());

  Future getClub(clubId) async {
    print('Club Provider called with ID: $clubId');
    try {
      final response =
          await httpClient.get(Uri.http(_baseUrl, '/api/clubs/$clubId/'));

      if (response.statusCode == 200) {
        final club = jsonDecode(response.body);

        print('club: $club');
        final adoptedClub = Club.fromJson(club);
        print('clubooooo: $adoptedClub');
        return Club.fromJson(club);
      } else if (response.statusCode == 400) {
        print('400 Error');
      }
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }
}
