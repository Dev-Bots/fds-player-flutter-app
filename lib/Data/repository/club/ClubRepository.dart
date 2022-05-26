import 'package:dev_player_fds/Data/models/models.dart';
import 'package:dev_player_fds/Data/provider/provider.dart';

class ClubRepository {
  final ClubDataProvider clubDataProvider = ClubDataProvider();

  Future getClub(clubID) async {
    return await clubDataProvider.getClub(clubID);
  }
}
