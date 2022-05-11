// ignore_for_file: file_names
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

// import 'package:mobile_banking/domain/models/Event.dart';

@immutable
class Account extends Equatable {
  const Account({
    this.accountID,
    this.userName,
    this.profilePicture,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.address,
    this.password,
    this.more,

    // this.password,
    // this.gender,
    // this.email,

    // this.registeredUsers,
  });

  final int? accountID;
  final String? userName;
  final String? password;
  final String? profilePicture;
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final String? address;
  final More? more;

  // final String? gender;
  // final String? email;

  // final int? phoneNumber;  !!!!!!!!!!!!!!!!!!!!!!!!!! This Needs to be reinstated
  // final List? registeredUsers;

  @override
  List<Object?> get props => [
        // This is what will be shown when you print(account)
        accountID,
        userName,
        // password,
        profilePicture,
        firstName,
        lastName,
        phoneNumber,
        address,
        more,

        // gender,
        // email,
      ];

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        accountID: json['id'],
        userName: json['username'],
        // password: json['password'],
        // profilePicture: json['profile_picture'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        phoneNumber: json['phone_number'],
        address: json['address'],
        more: json['more'] != null ? More.fromJson(json['more']) : null,

        // gender: json['gender'],
        // profilePicture: json['profile_picture'],

        // email: json['email'],

        // createdEvents: json['created_events'] != Null
        //     ? json['registered_clients']
        //         .map((account) => Event.fromJson(account))
        //         .toList()
        //     : []
      );

  Map<String, dynamic> toJson() {
    // final Map<String, dynamic> data = Map<String, dynamic>();
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = userName;
    data['password'] = password;
    data['profile_picture'] = profilePicture;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['phone_number'] = phoneNumber;
    data['address'] = address;
    if (more != null) {
      data['more'] = more!.toJson();
    }
    return data;
  }

  // @override
  // String toString() =>
  //     "TestAccount { first_name: $firstName, last_name: $lastName, address: $address, email: $email, phone_number: $phoneNumber, more: $more }";
}

class More {
  String? overview;
  String? gender;
  String? dob;
  String? video;
  File? birthCertificate;
  String? educationLevel;
  File? highestEducationEvidence;
  String? foot;
  double? weight;
  double? height;
  String? playingPossition1; // DOUBLE S IN THE NAME
  String? playingPossition2;

  More(
      {this.overview,
      this.gender,
      this.dob,
      this.video,
      this.birthCertificate,
      this.educationLevel,
      this.highestEducationEvidence,
      this.foot,
      this.weight,
      this.height,
      this.playingPossition1, // DOUBLE S IN THE NAME
      this.playingPossition2});

  @override
  List<Object?> get props => [
        overview,
        gender,
        dob,
        video,
        birthCertificate,
        educationLevel,
        highestEducationEvidence,
        foot,
        weight,
        height,
        playingPossition1, // DOUBLE S IN THE NAME
        playingPossition2,
      ];

  More.fromJson(Map<String, dynamic> json) {
    overview = json['overview'];
    gender = json['gender'];
    dob = json['dob'];
    video = json['video'];
    // birthCertificate = json['birth_certificate'];
    educationLevel = json['education_level'];
    // highestEducationEvidence = json['highest_education_evidence'];
    foot = json['foot'];
    weight = json['weight'];
    height = json['height'];
    playingPossition1 = json['playing_possition1']; // DOUBLE S IN THE NAME
    playingPossition2 = json['playing_possition2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['overview'] = overview;
    data['gender'] = gender;
    data['dob'] = dob;
    data['video'] = video;
    data['birth_certificate'] = birthCertificate;
    data['education_level'] = educationLevel;
    data['highest_education_evidence'] = highestEducationEvidence;
    data['foot'] = foot;
    data['weight'] = weight;
    data['height'] = height;
    data['playing_possition1'] = playingPossition1; // DOUBLE S IN THE NAME
    data['playing_possition2'] = playingPossition2;
    return data;
  }
}
