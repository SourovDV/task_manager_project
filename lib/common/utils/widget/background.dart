import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager_project/common/utils/path_name/image_path.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    super.key, required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(ImagePath.backgroundImage),
        Center(
            child: SafeArea(child: child)
        )
      ],
    );
  }
}