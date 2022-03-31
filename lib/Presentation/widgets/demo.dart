
import 'package:dev_player_fds/Bloc/AccountBloc/account_bloc.dart';
import 'package:dev_player_fds/Data/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dev_player_fds/Data/provider/provider.dart';
import '../../Data/repository/repository.dart';
import 'package:http/http.dart' as http;

class Demo extends StatelessWidget {
  Demo({Key? key}) : super(key: key);

  final repo = AccountRepository(
      accountDataProvider: AccountDataProvider(httpClient: http.Client()));

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AccountBloc(RepositoryProvider.of(context))
        ..add((GetOtherAccounts())),
      child: BlocBuilder<AccountBloc, AccountState>(
        builder: (context, state) {
          if (state is AccountLoading) {
            return Center(
                child: Column(
              children: const [
                CircularProgressIndicator(),
                Text('Loading...'),
              ],
            ));
          }
          if (state is AccountLoaded) {
            print(state.user);
          }
          return Container(
            child: ElevatedButton(
              onPressed: () {
                BlocProvider.of<AccountBloc>(context).add(GetMyAccount());
              },
              child: const Text('Get My Account'),
            ),
          );
        },
      ),
    );
  }
}
