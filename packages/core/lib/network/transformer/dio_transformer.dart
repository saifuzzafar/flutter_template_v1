import 'package:dio/dio.dart';

/// Default pharmarack api response is sent with text/html content-type while keeping the json structure,
/// which prevents dio from directly parsing the response into json-encoded models.
///
/// This transformer adds the json content-type to the response headers if it is not present.
/// Allowing dio to parse the response directly into the json-encoded models.
class DioTransformer extends BackgroundTransformer {
  @override
  Future<dynamic> transformResponse(
    RequestOptions options,
    ResponseBody responseBody,
  ) {
    final contentTypes = responseBody.headers[Headers.contentTypeHeader];
    bool hasJsonContentType = false;

    if (contentTypes != null && contentTypes.isNotEmpty) {
      for (String type in contentTypes) {
        if (type.contains(Headers.jsonContentType)) {
          hasJsonContentType = true;
          break;
        }
      }
    }

    if (!hasJsonContentType) {
      responseBody.headers[Headers.contentTypeHeader] = [
        Headers.jsonContentType
      ];
    }
    return super.transformResponse(options, responseBody);
  }
}
