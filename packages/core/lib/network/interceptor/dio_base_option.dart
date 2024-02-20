class DioBaseOption {
  final int connectTimeout;
  final String baseUrl;
  final int receiveTimeOut;
  final Map<String, dynamic>? headers;
  final String proxyBaseUrl;

  DioBaseOption({
    required this.baseUrl,
    this.connectTimeout = 20,
    this.receiveTimeOut = 20,
    this.headers,
    this.proxyBaseUrl = '',
  });
}
