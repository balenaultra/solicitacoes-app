class SolicitationEntity {
  int? id;
  int? operatorRequester;
  String? nameRequested;
  int? operatorRequested;
  int? codRequester;
  String? dscTypeRequested;
  String? dscRequester;
  String? dscSolicitor;
  String? detail;
  String? dateSolicitation;
  String? dateAnswer;
  bool? authorization;

  SolicitationEntity({
    this.id,
    this.operatorRequester,
    this.nameRequested,
    this.operatorRequested,
    this.codRequester,
    this.dscTypeRequested,
    this.dscRequester,
    this.dscSolicitor,
    this.detail,
    this.dateSolicitation,
    this.dateAnswer,
    this.authorization,
  });
}
