import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

class VideoThumbnailPlayer extends ConsumerStatefulWidget {
  const VideoThumbnailPlayer({super.key});

  @override
  ConsumerState<VideoThumbnailPlayer> createState() => _VideoThumbnailPlayerState();
}

class _VideoThumbnailPlayerState extends ConsumerState<VideoThumbnailPlayer> {
  late VideoPlayerController _controller;
  bool isLoading = true;
  String videoUrl = 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4';

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(videoUrl))..initialize().then((_) {
      isLoading = false;
      setState(() {});
    });

    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('video thumbnail'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : _buildVideoThumbnailGridView(),
      floatingActionButton: _buildVideoPlayButton(),
    );
  }

  // 影片播放棄
  Widget _buildVideoPlayButton() {
    return FloatingActionButton(
      onPressed: () {
        setState(() {
          _controller.value.isPlaying
              ? _controller.pause()
              : _controller.play();
        });
      },
      child: Icon(
        _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
      ),
    );
  }

  Widget _buildVideoThumbnailGridView(){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: GridView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
      child: VideoPlayer(_controller)
    );
  }
}