// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'solicitation_requests_repository.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _SolicitationRequestsRepository
    implements SolicitationRequestsRepository {
  _SolicitationRequestsRepository(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<SolicitationResponseDTO> getSolicitationOperator(pending) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<SolicitationResponseDTO>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/requests/operator?pending=$pending',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SolicitationResponseDTO.fromJson(_result.data!);
    return value;
  }

  @override
  Future<SolicitationResponseDTO> putSolicitation(replyResponseDTO) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(replyResponseDTO.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<SolicitationResponseDTO>(
            Options(method: 'PUT', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/requests/reply',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SolicitationResponseDTO.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
