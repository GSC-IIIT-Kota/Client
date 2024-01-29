import 'package:flutter/material.dart';
import 'package:solution_challenge/common/widgets/custom_shapes/containers/primary_ngo_container.dart';
import 'package:solution_challenge/features/donate/screens/ngo/widgets/ngo_appbar.dart';


class NgoScreen extends StatelessWidget {
  const NgoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PPrimaryNgoContainer(
              child: Column(
                children: [
                  PNgoAppBar()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


