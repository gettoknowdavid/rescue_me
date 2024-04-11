import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class FirstAidVideoWidget extends StatelessWidget {
  const FirstAidVideoWidget({super.key, required this.url});
  final String url;

  @override
  Widget build(BuildContext context) {
    final videoId = YoutubePlayer.convertUrlToId(url);

    final controller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(autoPlay: false, mute: false),
    );

    return SizedBox(
      height: 180.r,
      width: 1.sw,
      child: YoutubePlayer(
        controller: controller,
        showVideoProgressIndicator: true,
      ),
    );
  }
}
