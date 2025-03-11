import 'package:json_annotation/json_annotation.dart';
part 'responses.g.dart';

@JsonSerializable()
class BaseResponses {
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;
}

@JsonSerializable()
class CustomerResponses {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "numOfNotificotions")
  int? numOfNotificotions;

  CustomerResponses(this.id, this.name, this.numOfNotificotions);

  factory CustomerResponses.fromJson(Map<String, dynamic> json) =>
      _$CustomerResponsesFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerResponsesToJson(this);
}

@JsonSerializable()
class ContoctsResponses {
  @JsonKey(name: "phone")
  String? phone;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "link")
  String? link;
  ContoctsResponses(this.phone, this.email, this.link);

  factory ContoctsResponses.fromJson(Map<String, dynamic> json) =>
      _$ContoctsResponsesFromJson(json);

  Map<String, dynamic> toJson() => _$ContoctsResponsesToJson(this);
}

@JsonSerializable()
class AuthenticationResponse extends BaseResponses {
  @JsonKey(name: "customer")
  CustomerResponses? customer;
  @JsonKey(name: "contocts")
  ContoctsResponses? contocts;

  AuthenticationResponse(this.customer, this.contocts);

  factory AuthenticationResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticationResponseToJson(this);
}
