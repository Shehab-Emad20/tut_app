import 'package:tut_app/app/extensions.dart';
import 'package:tut_app/data/constants.dart';
import 'package:tut_app/data/response/responses.dart';
import 'package:tut_app/domain/models/models.dart';

extension CustomerResponsesMapper on CustomerResponses? {
  Customer toDomain() {
    return Customer(
      this?.id.orEmpty() ?? Constants.empty,
      this?.name.orEmpty() ?? Constants.empty,
      this?.numOfNotificotions.orZero() ?? Constants.zero,
    );
  }
}

extension ContactsResponsesMapper on ContoctsResponses? {
  Contacts toDomain() {
    return Contacts(
      this?.phone.orEmpty() ?? Constants.empty,
      this?.email.orEmpty() ?? Constants.empty,
      this?.link.orEmpty() ?? Constants.empty,
    );
  }
}

extension AuthenticationResponsesMapper on AuthenticationResponse? {
  Authentication toDomain() {
    return Authentication(this?.customer.toDomain(), this?.contocts.toDomain());
  }
}
