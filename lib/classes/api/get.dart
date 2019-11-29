import 'package:philips_remote/classes/models/channel.dart';
import 'package:philips_remote/classes/models/favorite_channel.dart';
import 'package:philips_remote/classes/network/remote_client.dart';
import 'package:philips_remote/classes/store/cache.dart';
import 'dart:convert';
import 'api.dart';

class Get {
  // "channeldb/tv/channelLists/all"
  static Future<List<Channel>> channelList() async {
    final url = API.baseUrl + "channeldb/tv/channelLists/all";

    final response = await RemoteClient.client.get(url);
    final jsonResponse = json.decode(response.body);

    final channels = ChannelList.fromJson(jsonResponse).channels;

    Cache.allChannels = channels;

    return channels;
  }

  // "channeldb/tv/channelLists/all"
  static Future<List<Channel>> favoriteChannelList() async {
    final url = API.baseUrl + "channeldb/tv/favoriteLists/1";

    final response = await RemoteClient.client.get(url);
    final jsonResponse = json.decode(response.body);

    final channels = FavoriteChannelList.fromJson(jsonResponse).channels;

    final List<Channel> channels2 = [];

    channels.forEach((fav) {
      final chan = Cache.allChannels.firstWhere((c) {
        return c.ccid == fav.ccid;
      });

      channels2.add(chan);
    });

    return channels2;
  }
}
