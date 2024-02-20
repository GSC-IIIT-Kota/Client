import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solution_challenge/common/widgets/ngo/event_card.dart';
import 'package:solution_challenge/models/event.dart';
import 'package:solution_challenge/services/event_service.dart';
import 'package:solution_challenge/utils/helpers/helper_functions.dart';

import '../../texts/section_heading.dart';
import '../../viewall/viewall_cards.dart';

class PEventSection extends StatelessWidget {
  const PEventSection({
    super.key,
    required this.sectionHeading,
    required this.initiativeType,
    required this.cardHeight,
  });

  final String sectionHeading;
  final String initiativeType;
  final double cardHeight;

  @override
  Widget build(BuildContext context) {
    final dark = PHelperFunctions.isDarkMode(context);

    return Column(
      children: [
        PSectionHeading(
        title: sectionHeading,
        textColor: dark ? Colors.white : Colors.black,
        onPressed: () => Get.to(() => PViewAllScreen(
          initiativeType: initiativeType,
        )),
      ),
        SizedBox(
          height: cardHeight,
          child: FutureBuilder<List<Event>?>(
            future: EventService().getEvents(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                final events = snapshot.data ?? [];
                if (events.isEmpty) {
                  return const Center(child: Text('No events found'));
                }
                return ListView.builder(
                  itemCount: events.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return PEventCard(
                      eventDate: events[index].date,
                      eventDayTime: events[index].time,
                      eventTitle: events[index].title,
                      eventLocation: events[index].location,
                      eventDesc: events[index].description,
                      eventPhoto: events[index].banner,
                      cardWidth: 300,
                    );

                  },
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
