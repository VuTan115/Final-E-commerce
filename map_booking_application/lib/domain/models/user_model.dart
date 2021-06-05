import 'package:equatable/equatable.dart';

import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserModel extends Equatable {
  final String? displayName;
  final String? email;
  final String uid;
  final String? phoneNumber;
  final String? photoUrl;
  const UserModel({
    this.displayName,
    this.email,
    required this.uid,
    this.phoneNumber,
    this.photoUrl,
  });
  static const empty = UserModel(uid: '');
  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  factory UserModel.fromUser(dynamic user) {
    return UserModel(
        displayName: user.displayName,
        email: user.email,
        uid: user.uid,
        phoneNumber: user.phoneNumber,
        photoUrl: user.photoURL);
  }

  @override
  List<Object?> get props => [displayName, email, photoUrl, uid, phoneNumber];
}
