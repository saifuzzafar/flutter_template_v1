class Flavor {
  final String appTitle;

  final String baseUrl;
  final Env env;

  Flavor({
    required this.appTitle,
    required this.baseUrl,
    this.env = Env.dev,
  });
}

enum Env { dev, uat, prod }
