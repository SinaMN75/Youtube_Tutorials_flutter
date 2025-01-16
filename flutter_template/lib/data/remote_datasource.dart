part of 'data.dart';

class RemoteDataSource {
  void login({
    required final LoginParams dto,
    required final Function(LoginResponse response) onResponse,
    required final Function(EmptyResponse response) error,
  }) async =>
      httpRequest(
        httpMethod: EHttpMethod.post,
        url: "${AppConstants.baseUrl}/users/login/",
        body: dto,
        action: (final Response<dynamic> response) => onResponse(LoginResponse.fromJson(response.bodyString!)),
        error: (final Response<dynamic> response) => error(EmptyResponse.fromJson(response.bodyString!)),
      );

}
