
import 'dart:convert';

List<Databasemodel> databasemodelFromJson(String str) =>
    List<Databasemodel>.from(json.decode(str).map((x) => Databasemodel.fromJson(x)));

String databasemodelToJson(List<Databasemodel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Databasemodel {
  Databasemodel({
    this.code,
    this.notifId,
    this.processId,
    this.timestamp,
    this.processSeen,
    this.reference,
    this.response,
    this.type,
});
  var code;
  var notifId;
  var processId;
  var timestamp;
  var processSeen;
  var reference;
  var response;
  var type;


  factory Databasemodel.fromJson(Map<String, dynamic> json) => Databasemodel(
    code: json["code"],
    notifId: json["notifId"],
    processId: json["processId"],
    timestamp: json["timestamp"],
    processSeen: json["seen"],
    reference: json["reference"],
    response: json["response"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "notifId": notifId,
    "processId": processId,
    "timestamp": timestamp,
    "processSeen": processSeen,
    "reference": reference,
    "response": response,
    "type": type,
  };

  toString() => ' "code": $code, '
      '"notifId": $notifId, '
      '"processId": $processId, '
      '"timestamp": $timestamp, '
      '"processSeen": $processSeen,'
      ' "reference": $reference,'
      ' "response": $response,'
      ' "type": $type';

  bool isProcessSeen() => processSeen == "seen";
}