import 'package:flutter/material.dart';
import 'package:solution_challenge/models/education/video.dart';
import 'package:solution_challenge/services/education/video_service.dart';
import 'package:solution_challenge/common/widgets/education/videos/video_card.dart';

class VideoBuilder extends StatefulWidget {
  const VideoBuilder({super.key});

  @override
  _VideoBuilderState createState() => _VideoBuilderState();
}

class _VideoBuilderState extends State<VideoBuilder> {
  late Future<List<Video>> videos;

  @override
  void initState() {
    super.initState();
    // Fetch videos from the video service and update the state
    videos=VideoService.getVideos();
    // print(videos);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Video>>(
      future: videos,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          List<Video> videoList  = snapshot.data ?? [];
          return ListView.builder(
            itemCount: videoList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              return PVideoCard(video: videoList[index]);
            },
          );
        }
      },
    );
  }
}
