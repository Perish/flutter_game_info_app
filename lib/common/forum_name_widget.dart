import 'package:flutter/material.dart';
import 'package:video_game_messaging_app/model/forum.dart';
import 'package:video_game_messaging_app/styleguide/colors.dart';
import 'package:video_game_messaging_app/styleguide/text_styles.dart';

class ForumNameWidget extends StatelessWidget {
  final Forum forum;
  ForumNameWidget({this.forum});
  @override
  Widget build(BuildContext context) {
    return Material(
      color: primaryColor,
      elevation: 20.0,
      shape: CustomShapeBorder(),
      child: Padding(
        padding: const EdgeInsets.only(top: 18.0, left: 16.0, right: 24.0, bottom: 5.0),
        child: Text(
          forum.title,
          style: forumNameTextStyle,
        ),
      ),
    );
  }
}
      
class CustomShapeBorder extends ShapeBorder {
  final double distanceFromWall = 12;
  final double controlPointDistanceFromWall = 2;

  @override
  EdgeInsetsGeometry get dimensions => null;

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    return null;
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    return getClip(Size(130.0, 60.0));
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {
  }

  @override
  ShapeBorder scale(double t) {
    return null;
  }

  Path getClip(Size size) {
    Path clippedPath = Path();
    // 移动到(x=12, y=0)这个点
    clippedPath.moveTo(0 + distanceFromWall, 0);
    // 画二阶贝塞尔曲线从点(x1=2, y1=2)到点(x2=0, y2=12)
    clippedPath.quadraticBezierTo(0 + controlPointDistanceFromWall, 0 + controlPointDistanceFromWall, 0, 0 + distanceFromWall);
    // 画左边的直线
    clippedPath.lineTo(0, size.height - distanceFromWall);
    clippedPath.quadraticBezierTo(0 + controlPointDistanceFromWall, size.height - controlPointDistanceFromWall, 0 + distanceFromWall, size.height);
    clippedPath.lineTo(size.width - distanceFromWall, size.height);
    clippedPath.quadraticBezierTo(size.width - controlPointDistanceFromWall, size.height - controlPointDistanceFromWall, size.width, size.height - distanceFromWall);
    clippedPath.lineTo(size.width, size.height * 0.6);
    clippedPath.quadraticBezierTo(size.width - 1, size.height * 0.6 - distanceFromWall, size.width - distanceFromWall, size.height * 0.6 - distanceFromWall - 3);
    clippedPath.lineTo(0 + distanceFromWall + 6, 0);

    clippedPath.close();
    return clippedPath;
  }
}