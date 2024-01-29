import 'package:flutter/material.dart';
import 'package:solution_challenge/common/widgets/custom_shapes/curved_edges/curved_edges.dart';

class PCurvedEdgeWidget extends StatelessWidget {
  const PCurvedEdgeWidget({
    super.key, this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: PCustomCurvedEdges(),
      child: child,
    );
  }
}