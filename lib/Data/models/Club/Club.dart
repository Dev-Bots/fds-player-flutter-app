class Club {
  int? id;
  String? username;
  String? password;
  String? profilePicture;
  String? phoneNumber;
  String? address;
  String? type;
  ClubMore? clubMore;

  Club(
      {this.id,
      this.username,
      this.password,
      this.profilePicture,
      this.phoneNumber,
      this.address,
      this.type,
      this.clubMore});

  Club.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    profilePicture = json['profile_picture'];
    phoneNumber = json['phone_number'];
    address = json['address'];
    type = json['type'];
    address = json['address'];
    clubMore = json['more'] != null ? ClubMore.fromJson(json['more']) : null;
  }
}

class ClubMore {
  String? clubName;
  String? acronym;
  String? organizationType;
  String? website;
  String? establishmentYear;

  ClubMore(
      {this.clubName,
      this.acronym,
      this.organizationType,
      this.website,
      this.establishmentYear});

  ClubMore.fromJson(Map<String, dynamic> json) {
    clubName = json['club_name'];
    acronym = json['acronym'];
    organizationType = json['organization_type'];
    website = json['website'];
    establishmentYear = json['establishment_year'];
  }
}
