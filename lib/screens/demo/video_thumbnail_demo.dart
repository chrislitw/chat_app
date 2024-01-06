


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:path_provider/path_provider.dart';

class VideoThumbnailDemo extends ConsumerStatefulWidget {
  const VideoThumbnailDemo({super.key});

  @override
  ConsumerState<VideoThumbnailDemo> createState() => _VideoThumbnailDemoState();
}

class _VideoThumbnailDemoState extends ConsumerState<VideoThumbnailDemo> {
  bool isLoading = true;
  String fileName = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _getVideoThumbnail();
  }

  _getVideoThumbnail() async {
    fileName = await VideoThumbnail.thumbnailFile(
      video:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
      thumbnailPath: (await getTemporaryDirectory()).path,
      imageFormat: ImageFormat.WEBP,
      maxHeight: 64,
      quality: 100,
    ) ?? '';

    print('fileName: $fileName');
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('video thumbnail'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : _buildVideoThumbnailGridView(),
    );
  }

  Widget _buildVideoThumbnailGridView(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: GridView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.0,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
        ),
        children: [
          _buildVideoThumbnail(Colors.greenAccent),
          _buildVideoThumbnail(Colors.greenAccent),
        ],
      ),
    );
  }

  Widget _buildVideoThumbnail(Color color) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: Image.asset(fileName, width: double.infinity, height: double.infinity, fit: BoxFit.cover,),
    );
  }

}
