class Request {
  int? id;
  int? idUserRequester;
  String? nameRequester;
  int? idUserRequested;
  int? idRequestType;
  String? requestTypeDescription;
  String? requestMessage;
  String? requestDate;
  String? requestDetail;
  bool? response;
  String? responseMessage;
  String? responseDate;

  Request(
      this.id,
      this.idUserRequester,
      this.nameRequester,
      this.idUserRequested,
      this.idRequestType,
      this.requestTypeDescription,
      this.requestMessage,
      this.requestDate,
      this.requestDetail,
      this.response,
      this.responseMessage,
      this.responseDate);

  Request.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    idUserRequester = json['id_user_requester'];
    idUserRequested = json['id_user_requested'];
    idRequestType = json['id_request_type'];
    response = json['response'];
    responseMessage = json['response_message'];
    requestMessage = json['request_message'];
    requestDate = json['request_date'];
    responseDate = json['response_date'];
    requestDetail = json['request_detail'];
    requestTypeDescription = json['request_type_description'];
    nameRequester = json['name_requester'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_user_requester'] = this.idUserRequester;
    data['id_user_requested'] = this.idUserRequested;
    data['id_request_type'] = this.idRequestType;
    data['response'] = this.response;
    data['response_message'] = this.responseMessage;
    data['request_message'] = this.requestMessage;
    data['request_date'] = this.requestDate;
    data['response_date'] = this.responseDate;
    data['request_detail'] = this.requestDetail;
    data['request_type_description'] = this.requestTypeDescription;
    data['name_requester'] = this.nameRequester;
    return data;
  }

  @override
  String toString() {
    return 'Request{id: $id, idUserRequester: $idUserRequester, nameRequester: $nameRequester, idUserRequested: $idUserRequested, idRequestType: $idRequestType, requestTypeDescription: $requestTypeDescription, requestMessage: $requestMessage, requestDate: $requestDate, requestDetail: $requestDetail, response: $response, responseMessage: $responseMessage, responseDate: $responseDate}';
  }
}