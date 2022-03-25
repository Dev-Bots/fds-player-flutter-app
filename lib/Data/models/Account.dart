// ignore_for_file: file_names
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

// import 'package:mobile_banking/domain/models/Event.dart';

@immutable
class Account extends Equatable {
  const Account({
    this.accountID,
    required this.firstName,
    required this.lastName,
    this.fullName,
    required this.userName,
    required this.gender,
    // this.profilePicture,
    required this.dob,
    required this.email,
    required this.phoneNumber,
    required this.address,
    // this.registeredUsers,
  });

  final int? accountID;

  final String? firstName;
  final String? lastName;
  final String? fullName;
  final String? userName;
  final String? gender;
  // final profilePicture;
  final String? dob;
  final String? email;
  final int? phoneNumber;
  final String? address;

  // final List? registeredUsers;
 @override
  List<Object?> get props => [
        accountID,
        firstName,
        lastName,
        fullName,
        userName,
        gender,
        // profilePicture,
        dob,
        email,
        phoneNumber,
        address,
        // createdEvents,
      ];

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        firstName: json['firstName'],
        lastName: json['lastName'],
        fullName: json['fullName'],
        userName: json['userName'],
        gender: json['gender'],
        // profilePicture: json['profile_picture'],
        dob: json['dob'],
        email: json['email'],
        phoneNumber: json['phoneNumber'],
        address: json['address'],

        // createdEvents: json['created_events'] != Null
        //     ? json['registered_clients']
        //         .map((account) => Event.fromJson(account))
        //         .toList()
        //     : []
      );
       Map<String, dynamic> toJson() => {
        'id': accountID, //if Api accepts id, then use it
        'first_name': firstName,
        'last_name': lastName,
        'full_name': fullName,
        'user_name': userName,
        'gender': gender,
        // 'profile_picture': profilePicture,
        'DOB': dob,
        'email': email,
        'phone_number': phoneNumber,
        'address': address,

        // 'registered_clients':
        //     registeredUsers!.map((account) => account.toJson()).toList()
      };
  // @override
  // String toString() =>
  //     'Agent { first_name: $firstName, last_name: $lastName, fullname: $fullName, address: $address, DOB: $dob}';
}