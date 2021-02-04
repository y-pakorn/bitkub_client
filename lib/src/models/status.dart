import 'dart:convert';

import 'package:meta/meta.dart';

import '../helper.dart';

///Bitkub endpoints status object
///contains [secureEndpoint] and [nonSecureEndpoint] status.
///Used in BitkubClient
class BkStatus {
  const BkStatus(
    this.secureEndpoint,
    this.nonSecureEndpoint,
  );

  final BkEndpointStatus secureEndpoint;
  final BkEndpointStatus nonSecureEndpoint;

  factory BkStatus.fromJson(String str) => BkStatus._fromList(json.decode(str));

  factory BkStatus._fromList(List<Map<String, dynamic>> list) => BkStatus(
        BkEndpointStatus._fromMap(list[0]),
        BkEndpointStatus._fromMap(list[0]),
      );
}

///Bitkub endpoint status object
///Used in BkStatus
class BkEndpointStatus {
  const BkEndpointStatus({
    @required this.endpoint,
    @required this.status,
    @required this.message,
  }) : assert(endpoint != null && status != null && message != null);

  ///Type of endpoint [this] is
  ///Can be [BkEndpoint.NON_SECURE] or [BkEndpoint.SECURE]
  final BkEndpoint endpoint;

  ///Status provided from the server in `String`
  final String status;

  ///Message provided from the server
  ///Usually be blank.
  final String message;

  ///Return `true` if [status] is 'Ok'
  bool get isOk => status == 'Ok';

  //factory BkEndpointStatus._fromJson(String str) =>
  //BkEndpointStatus._fromMap(json.decode(str));

  factory BkEndpointStatus._fromMap(Map<String, dynamic> json) =>
      BkEndpointStatus(
        endpoint: _bkEndpointMap.map[json['name']],
        status: json['status'],
        message: json['message'],
      );
}

enum BkEndpoint { NON_SECURE, SECURE }

const _bkEndpointMap = EnumValues({
  'Non-secure endpoints': BkEndpoint.NON_SECURE,
  'Secure endpoints': BkEndpoint.SECURE,
});
