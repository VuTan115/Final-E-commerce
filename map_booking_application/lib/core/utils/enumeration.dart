import 'package:json_annotation/json_annotation.dart';

enum AppMode {
  @JsonValue(0)
  unknown,
  @JsonValue(1)
  manager,
  @JsonValue(2)
  customer,
  @JsonValue(3)
  partner,
}

enum AuthStatus {
  @JsonValue(0)
  unknown,
  @JsonValue(1)
  authenticated,
  @JsonValue(2)
  unauthenticated,
}

enum UserStatus {
  @JsonValue(0)
  unknown,
  @JsonValue(1)
  approving,
  @JsonValue(2)
  activated,
  @JsonValue(3)
  expired,
  @JsonValue(4)
  locked,
  @JsonValue(5)
  deleted,
}

enum GenderType {
  @JsonValue(0)
  unknown,
  @JsonValue(1)
  male,
  @JsonValue(2)
  female,
}
