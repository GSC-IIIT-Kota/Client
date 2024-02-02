import 'package:flutter/material.dart';
import 'package:solution_challenge/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:solution_challenge/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:solution_challenge/utils/constants/colors.dart';

class PPrimaryNgoContainer extends StatelessWidget {
  const PPrimaryNgoContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return  PCurvedEdgeWidget(
      child: Container(
        color: TColors.primary,
        padding: const EdgeInsets.only(bottom: 0),
        child: Stack(
            children: [
              Positioned(
                top: -150,
                right: -250,
                child: PCircularContainer(
                  backgroundColor: TColors.accent.withOpacity(0.1),
                ),
              ),
              Positioned(
                top: 100,
                right: -300,
                child: PCircularContainer(
                  backgroundColor: TColors.accent.withOpacity(0.1),
                ),
              ),
              child,
            ],
          ),
      )
    );
  }
}
