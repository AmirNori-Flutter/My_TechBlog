import 'package:flutter/material.dart';
import 'package:techblog/gen/assets.gen.dart';

class ProfileScrren extends StatelessWidget {
  const ProfileScrren({
    super.key,
    required this.size,
    required this.text_theme,
    required this.bodyMargin,
  });

  final Size size;
  final TextTheme text_theme;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          Image(image: Assets.icons.avatar.provider()),
        ],
      ),
    );
  }
}
