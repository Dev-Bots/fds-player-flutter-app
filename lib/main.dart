import 'dart:convert';

import 'package:fds_player_flutter_app/Bloc/AccountBloc/account_bloc.dart';
import 'package:fds_player_flutter_app/Data/provider/Account/AccountProvider.dart';
import 'package:fds_player_flutter_app/Presentation/config/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import 'package:fds_player_flutter_app/Data/repository/repository.dart';

void main() => runApp(PlayerApp());

class PlayerApp extends StatelessWidget {
  PlayerApp({Key? key}) : super(key: key);

//  There is BlocProvider here because the AccountBloc is needed globally
  final repo = AccountRepository(
      accountDataProvider: AccountDataProvider(httpClient: http.Client()));

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
        value: repo,
        // child: BlocProvider(
        //   create: (context) => AccountBloc(accountRepository: accountRepository)
        //     ..add(GetMyAccount()),
        child: MaterialApp(
          title: 'Banking App',
          theme: ThemeData(
            textTheme: GoogleFonts.ubuntuTextTheme(
              Theme.of(context).textTheme,
            ),
            // primaryColor: Colors.grey[50],
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: RouteGenerator.loginPage,
          onGenerateRoute: RouteGenerator.generateRoute,
        ));
  }
}
