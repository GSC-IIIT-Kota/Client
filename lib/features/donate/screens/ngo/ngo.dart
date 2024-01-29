import 'package:flutter/material.dart';

import 'package:solution_challenge/common/widgets/custom_shapes/containers/primary_ngo_container.dart';


class NgoScreen extends StatelessWidget {
  const NgoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PPrimaryNgoContainer(
              child: Container(),
            )
          ],
        ),
      ),
    );
  }
}