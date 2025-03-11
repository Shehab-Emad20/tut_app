// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponses _$BaseResponsesFromJson(Map<String, dynamic> json) =>
    BaseResponses()
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?;

Map<String, dynamic> _$BaseResponsesToJson(BaseResponses instance) =>
    <String, dynamic>{'status': instance.status, 'message': instance.message};

CustomerResponses _$CustomerResponsesFromJson(Map<String, dynamic> json) =>
    CustomerResponses(
      json['id'] as String?,
      json['name'] as String?,
      (json['numOfNotificotions'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CustomerResponsesToJson(CustomerResponses instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'numOfNotificotions': instance.numOfNotificotions,
    };

ContoctsResponses _$ContoctsResponsesFromJson(Map<String, dynamic> json) =>
    ContoctsResponses(
      json['phone'] as String?,
      json['email'] as String?,
      json['link'] as String?,
    );

Map<String, dynamic> _$ContoctsResponsesToJson(ContoctsResponses instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'email': instance.email,
      'link': instance.link,
    };

AuthenticationResponse _$AuthenticationResponseFromJson(
  Map<String, dynamic> json,
) =>
    AuthenticationResponse(
        json['customer'] == null
            ? null
            : CustomerResponses.fromJson(
              json['customer'] as Map<String, dynamic>,
            ),
        json['contocts'] == null
            ? null
            : ContoctsResponses.fromJson(
              json['contocts'] as Map<String, dynamic>,
            ),
      )
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?;

Map<String, dynamic> _$AuthenticationResponseToJson(
  AuthenticationResponse instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'customer': instance.customer,
  'contocts': instance.contocts,
};
