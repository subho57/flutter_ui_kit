import 'package:flutter/widgets.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDClipShadowPainter.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDEdge.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDTrapezoidClipper.dart';

class Trapezoid extends StatelessWidget {
  const Trapezoid({Key key, @required this.cutLength, @required this.child, this.edge = Edge.TOP, this.clipShadows = const []}) : super(key: key);

  final Widget child;
  final double cutLength;
  final Edge edge;

  ///List of shadows to be cast on the border
  final List<ClipShadow> clipShadows;

  @override
  Widget build(BuildContext context) {
    var clipper = TrapezoidClipper(cutLength, edge);
    return CustomPaint(
      painter: ClipShadowPainter(clipper, clipShadows),
      child: ClipPath(
        clipper: clipper,
        child: child,
      ),
    );
  }
}
