import 'package:flutter/material.dart';
import 'package:solution_challenge/features/education/screens/resources/widgets/EduationCard.dart';
import 'package:solution_challenge/features/education/screens/resources/widgets/youtubeVideos.dart';

class EducationScreen extends StatelessWidget {
  const EducationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.pink[400]!, Colors.pink[200]!],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 100), // Spacer for top margin
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.0),
              child: Text(
                'How is your health today?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 38.0,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 25), // Spacer between text and cards
            SizedBox(
              height: 200, // Adjust the height based on your requirement
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: 5, // Number of cards
                itemBuilder: (context, index) {
                  return EducationCard(
                    title: 'Card $index',
                    content:
                        'This is the content for card $index. Learn more...',
                  );
                },
              ),
            ),
            const Expanded(
              child: YoutubeVideoPlayer(videoUrl: 'https://www.youtube.com/watch?v=your_video_id_here'),
            ),
          ],
        ),
      ),
    );
  }
}
