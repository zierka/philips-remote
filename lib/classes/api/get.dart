import 'package:philips_remote/classes/models/channel.dart';
import 'package:philips_remote/classes/network/remote_client.dart';
import 'dart:convert';
import 'api.dart';

class Get {
  // "channeldb/tv/channelLists/all"
  static Future<List<Channel>> channelList() async {
    final url = API.baseUrl + "channeldb/tv/channelLists/all";

    final response = await RemoteClient.client.get(url);
    final jsonResponse = json.decode(response.body);

    final channels = ChannelList.fromJson(jsonResponse).channels;

    return channels;
  }
}
