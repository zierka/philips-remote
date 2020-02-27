import 'package:cached_network_image/cached_network_image.dart';
import 'package:path/path.dart' as p;
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:path_provider/path_provider.dart';
import 'package:philips_remote/classes/network/remote_client.dart';

import 'dart:async';
import 'dart:typed_data';
import 'dart:convert';

import 'package:http/http.dart' as http;

class CustomCacheManager extends BaseCacheManager {
  static const key = "libCachedImageData";

  static CustomCacheManager _instance;

  /// The DefaultCacheManager that can be easily used directly. The code of
  /// this implementation can be used as inspiration for more complex cache
  /// managers.
  factory CustomCacheManager() {
    if (_instance == null) {
      _instance = new CustomCacheManager._();
    }
    return _instance;
  }

  CustomCacheManager._() : super(key, fileFetcher: _customHttpGetter);

  Future<String> getFilePath() async {
    var directory = await getTemporaryDirectory();
    return p.join(directory.path, key);
  }

  static Future<FileFetcherResponse> _customHttpGetter(String url,
      {Map<String, String> headers}) async {
    return HttpFileFetcherResponse(await RemoteClient.getImage(url));
  }
}
