class TV extends TVCandidate {
  String protocol;
  int port;
  int apiVersion;

  get baseUrl =>
      protocol +
      "://" +
      ip +
      ":" +
      port.toString() +
      "/" +
      apiVersion.toString() +
      "/";

  TV({
    TVCandidate candidate,
    this.protocol,
    this.port,
    this.apiVersion,
  }) : super(
          ip: candidate.ip,
          name: candidate.name,
          friendlyName: candidate.friendlyName,
        );

  // TV.fromCandidate2({
  //   TVCandidate2 candidate2,
  //   this.protocol,
  //   this.apiVersion,
  // }) : super(
  //         ip: candidate.ip,
  //         name: candidate.name,
  //         friendlyName: candidate.friendlyName,
  //       );
}

class TVCandidate {
  String ip;
  String name;
  String friendlyName;

  TVCandidate({this.ip, this.name, this.friendlyName});
}

class TVCandidate2 {
  String ip;
  int port;

  TVCandidate2({this.ip, this.port});
}
