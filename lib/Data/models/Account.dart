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
