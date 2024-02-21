import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solution_challenge/common/widgets/appbar/appbar.dart';
import 'package:solution_challenge/utils/constants/colors.dart';
import 'package:solution_challenge/utils/helpers/helper_functions.dart';
import '../../../../../utils/userPrefernces/userProvider.dart';

class PEducationAppbar extends StatelessWidget {
  const PEducationAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    final dark = PHelperFunctions.isDarkMode(context);
    return PAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Hey Beautiful,",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: dark ? Colors.white : TColors.rani)),
          Text(user?.profile.firstName ?? "",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .apply(color: dark ? Colors.white : TColors.rani)),
        ],
      ),
      // actions: [
      // ],
    );
  }
}
