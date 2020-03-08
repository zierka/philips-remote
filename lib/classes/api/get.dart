import 'package:philips_remote/classes/models/application.dart';
import 'package:philips_remote/classes/models/channel.dart';
import 'package:philips_remote/classes/models/favorite_channel.dart';
import 'package:philips_remote/classes/models/volume.dart';
import 'package:philips_remote/classes/network/remote_client.dart';
import 'package:philips_remote/classes/store/cache.dart';
import 'package:philips_remote/classes/api/api.dart';
import 'package:philips_remote/classes/logic/convenience.dart';

class Get {
  // "audio/volume"
  static Future<Volume> volume() async {
    final url = API.baseUrl + "audio/volume";
    final response = await RemoteClient.get(url);
    final volume = Volume.fromJson(response.toJson());

    Cache.volume = volume;

    return volume;
  }

  // "channeldb/tv/channelLists/all"
  static Future<List<Channel>> channelList() async {
    final url = API.baseUrl + "channeldb/tv/channelLists/all";
    final response = await RemoteClient.get(url);
    final channels = ChannelList.fromJson(response.toJson()).channels;

    Cache.allChannels = channels;

    return channels;
  }

  // "channeldb/tv/channelLists/all"
  static Future<List<Channel>> favoriteChannelList() async {
    final url = API.baseUrl + "channeldb/tv/favoriteLists/1";
    final response = await RemoteClient.get(url);
    final channels = FavoriteChannelList.fromJson(response.toJson()).channels;

    // as the results are partial channel classes, get the full channel classes from the cache

    final List<Channel> channels2 = [];

    channels.forEach((fav) {
      final chan = Cache.allChannels.firstWhere((c) {
        return c.ccid == fav.ccid;
      });

      if (chan != null) {
        channels2.add(chan);
      }
    });

    return channels2;
  }

  static Future<List<Application>> applicationList() async {
    final url = API.baseUrl + "applications";
    final response = await RemoteClient.get(url);
    final applications =
        ApplicationResponse.fromJson(response.toJson()).applications;
    return applications;
  }
}
