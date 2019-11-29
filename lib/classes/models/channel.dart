class Channel {
  final int ccid;
  final String preset; // channel position
  final String name;

  Channel.fromJson(Map<String, dynamic> json)
      : ccid = json['ccid'],
        preset = json['preset'],
        name = json['name'];
}

class ChannelList {
  final String id;
  final List<Channel> channels;

  ChannelList.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        channels = List<Channel>.from(json['Channel'].map(
          (item) => Channel.fromJson(item),
        ));
}
