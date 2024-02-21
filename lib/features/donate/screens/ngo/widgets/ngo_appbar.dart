import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solution_challenge/common/widgets/appbar/appbar.dart';
import 'package:solution_challenge/common/widgets/ngo/notification_icon.dart';
import 'package:solution_challenge/utils/constants/colors.dart';
import '../../../../../utils/userPrefernces/userProvider.dart';

class PNgoAppBar extends StatelessWidget {
  const PNgoAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return PAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Feeling Generous,",style: Theme.of(context).textTheme.labelMedium!.apply(color: TColors.accent)),
          Text("${user?.profile.firstName}",style: Theme.of(context).textTheme.headlineMedium!.apply(color: Colors.white)),
        ],
      ),
      actions: [
        PNotificationIcon(onPressed: () {}, iconColor: Colors.white,)
      ],
    );
  }
}
