import 'package:philips_remote/logic/models/application.dart';
import 'package:philips_remote/logic/models/channel.dart';
import 'package:philips_remote/logic/models/favorite_channel.dart';
import 'package:philips_remote/logic/models/volume.dart';
import 'package:philips_remote/data_access/network_client/endpoint_network_client.dart';
import 'package:philips_remote/data_access/persistence/cache.dart';
import 'package:philips_remote/util/convenience.dart';

class InfoRepository {
  EndpointNetworkClient _client;
  InfoRepository(this._client);

  /// "audio/volume"
  Future<Volume> volume() async {
    final endpoint = "audio/volume";
    final response = await _client.get(endpoint);
    final volume = Volume.fromJson(response.toJson());

    Cache.volume = volume;

    return volume;
  }

  /// "channeldb/tv/channelLists/all"
  Future<List<Channel>> channelList() async {
    final endpoint = "channeldb/tv/channelLists/all";
    final response = await _client.get(endpoint);
    final channels = ChannelList.fromJson(response.toJson()).channels;

    Cache.allChannels = channels;

    return channels;
  }

  /// "channeldb/tv/channelLists/all"
  Future<List<Channel>> favoriteChannelList() async {
    final endpoint = "channeldb/tv/favoriteLists/1";
    final response = await _client.get(endpoint);
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

  Future<List<Application>> applicationList() async {
    final endpoint = "applications";
    final response = await _client.get(endpoint);
    final applications =
        ApplicationResponse.fromJson(response.toJson()).applications;
    return applications;
  }
}
