class DiscoveryConfiguration {
  final String scheme;
  final int port;

  static const nonAndroid = DiscoveryConfiguration(scheme: "http", port: 1925);
  static const android = DiscoveryConfiguration(scheme: "https", port: 1926);

  static const apiVersions = [6, 5, 2];

  const DiscoveryConfiguration({this.scheme, this.port});
}
