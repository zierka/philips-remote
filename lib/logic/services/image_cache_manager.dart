import 'dart:io';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:phimote/data_access/network_client/endpoint_network_client.dart';
import 'dart:async';
import 'package:clock/clock.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_cache_manager/src/web/mime_converter.dart';

class ImageCacheManager extends CacheManager {
  static const key = "libCachedImageData";

  static late EndpointNetworkClient _client;

  static ImageCacheManager? _instance;

  factory ImageCacheManager(EndpointNetworkClient client) {
    if (_instance == null) {
      _client = client;
      _instance = new ImageCacheManager._(client);
    }
    return _instance!;
  }

  ImageCacheManager._(EndpointNetworkClient client)
      : super(Config(key, fileService: _FileService(client)));
}

class _FileService extends FileService {
  EndpointNetworkClient client;

  _FileService(this.client);

  @override
  Future<FileServiceResponse> get(String url,
      {Map<String, String>? headers}) async {
    final response = await client.get(url);

    return _HttpGetResponse(response);
  }
}

/// Basic implementation of a [FileServiceResponse] for http requests.
class _HttpGetResponse implements FileServiceResponse {
  _HttpGetResponse(this._response);

  final DateTime _receivedTime = clock.now();

  final http.Response _response;

  @override
  int get statusCode => _response.statusCode;

  bool _hasHeader(String name) {
    return _response.headers.containsKey(name);
  }

  String? _header(String name) {
    return _response.headers[name];
  }

  @override
  Stream<List<int>> get content => Stream.value(_response.bodyBytes);

  @override
  int? get contentLength => _response.contentLength;

  @override
  DateTime get validTill {
    // Without a cache-control header we keep the file for a week
    var ageDuration = const Duration(days: 7);
    if (_hasHeader(HttpHeaders.cacheControlHeader)) {
      // TODO: check if this is ok. force unwrap
      final controlSettings =
          _header(HttpHeaders.cacheControlHeader)!.split(',');
      for (final setting in controlSettings) {
        final sanitizedSetting = setting.trim().toLowerCase();
        if (sanitizedSetting == 'no-cache') {
          ageDuration = const Duration();
        }
        if (sanitizedSetting.startsWith('max-age=')) {
          var validSeconds = int.tryParse(sanitizedSetting.split('=')[1]) ?? 0;
          if (validSeconds > 0) {
            ageDuration = Duration(seconds: validSeconds);
          }
        }
      }
    }

    return _receivedTime.add(ageDuration);
  }

  // TODO: check if this is ok. force unwrap
  @override
  String? get eTag => _hasHeader(HttpHeaders.etagHeader)
      ? _header(HttpHeaders.etagHeader)
      : null;

  @override
  String get fileExtension {
    var fileExtension = '';

    if (_hasHeader(HttpHeaders.contentTypeHeader)) {
      // TODO: check if this is ok. force unwrap
      var contentType =
          ContentType.parse(_header(HttpHeaders.contentTypeHeader)!);
      fileExtension = contentType.fileExtension ?? '';
    }
    return fileExtension;
  }
}
