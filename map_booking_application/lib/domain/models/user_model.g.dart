// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
    displayName: json['displayName'] as String?,
    email: json['email'] as String?,
    uid: json['uid'] as String,
    phoneNumber: json['phoneNumber'] as String?,
    photoUrl: json['photoUrl'] as String?,
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'displayName': instance.displayName,
      'email': instance.email,
      'uid': instance.uid,
      'phoneNumber': instance.phoneNumber,
      'photoUrl': instance.photoUrl,
    };
