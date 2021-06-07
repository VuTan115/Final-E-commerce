// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppSettings _$AppSettingsFromJson(Map<String, dynamic> json) {
  return AppSettings(
    json['key'] as String,
    _$enumDecode(_$AppModeEnumMap, json['mode']),
    region: json['region'] as String,
    language: json['language'] as String,
    timeZone: json['timeZone'] as String,
    isFirstTime: json['isFirstTime'] as bool,
    onboardingViews: json['onboardingViews'] as int,
  );
}

Map<String, dynamic> _$AppSettingsToJson(AppSettings instance) =>
    <String, dynamic>{
      'key': instance.key,
      'mode': _$AppModeEnumMap[instance.mode],
      'region': instance.region,
      'language': instance.language,
      'timeZone': instance.timeZone,
      'isFirstTime': instance.isFirstTime,
      'onboardingViews': instance.onboardingViews,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$AppModeEnumMap = {
  AppMode.unknown: 0,
  AppMode.manager: 1,
  AppMode.customer: 2,
  AppMode.partner: 3,
};
