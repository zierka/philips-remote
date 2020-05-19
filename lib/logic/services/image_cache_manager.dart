import 'package:path/path.dart' as path;
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:path_provider/path_provider.dart';
import 'package:philips_remote/data_access/network_client/endpoint_network_client.dart';
import 'dart:async';

class ImageCacheManager extends BaseCacheManager {
  static const key = "libCachedImageData";

  static EndpointNetworkClient _client;

  static ImageCacheManager _instance;

  factory ImageCacheManager(EndpointNetworkClient client) {
    if (_instance == null) {
      _client = client;
      _instance = new ImageCacheManager._(client);
    }
    return _instance;
  }

  ImageCacheManager._(EndpointNetworkClient client)
      : super(key, fileFetcher: _customHttpGetter);

  Future<String> getFilePath() async {
    var directory = await getTemporaryDirectory();
    return path.join(directory.path, key);
  }

  static Future<FileFetcherResponse> _customHttpGetter(String url,
      {Map<String, String> headers}) async {
    return HttpFileFetcherResponse(await _client.get(url));
  }
}
