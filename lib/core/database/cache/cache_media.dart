import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class CustomCacheManager {
  static const cacheKey = 'videoCache';

  static CacheManager instance = CacheManager(
    Config(
      cacheKey,
      stalePeriod: const Duration(days: 10),
      maxNrOfCacheObjects: 150,
      repo: JsonCacheInfoRepository(databaseName: cacheKey),
      fileService: HttpFileService(),
    ),
  );
}
