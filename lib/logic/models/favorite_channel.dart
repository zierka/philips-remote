class FavoriteChannel {
  final int ccid;
  final String preset; // channel position

  FavoriteChannel.fromJson(Map<String, dynamic> json)
      : ccid = json['ccid'],
        preset = json['preset'];
}

class FavoriteChannelList {
  final String id;
  final String name;
  final List<FavoriteChannel> channels;

  FavoriteChannelList.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        channels = List<FavoriteChannel>.from(json['channels'].map(
          (item) => FavoriteChannel.fromJson(item),
        ));
}
