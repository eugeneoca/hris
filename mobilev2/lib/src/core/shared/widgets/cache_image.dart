import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/file.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class ChachedImageNetwork extends StatefulWidget {
  final String url;
  final BoxFit? boxFit;
  final double? height;
  final double? width;
  const ChachedImageNetwork({super.key, required this.url, this.boxFit = BoxFit.cover, this.height = 100, this.width = 100});

  @override
  State<ChachedImageNetwork> createState() => _ChachedImageNetworkState();
}

class _ChachedImageNetworkState extends State<ChachedImageNetwork> {
  Future<File?> _fetchImage() async {
    // Create a DefaultCacheManager instance

    // Fetch the image using the cache manager
    try {
      final cacheManager = DefaultCacheManager();

      return await cacheManager.getSingleFile(widget.url);
    } catch (e) {
      return null; // Return null or handle error as needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _fetchImage(),
      builder: (context, snapshot) {
        snapshot.data;
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            // TODO: Handle this case.
            return Image.file(
              fit: widget.boxFit,
              height: widget.height,
              width: widget.width,
              snapshot.data!,
            );
          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}
