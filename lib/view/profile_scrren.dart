import 'package:flutter/material.dart';
import 'package:techblog/Constants/my_colors.dart';
import 'package:techblog/Constants/my_string.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/my_component.dart';

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
      child: Padding(
        padding: const EdgeInsets.only(top: 60.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: Assets.icons.avatar.provider(), height: 100),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageIcon(
                  Assets.icons.bluepen.provider(),
                  color: SolidColors.seeMore,
                ),
                SizedBox(width: 8),
                Text(MyStrings.imageProfileEdit, style: text_theme.displaySmall),
              ],
            ),
            SizedBox(height: 60),
            Text("فاطمه امیری", style: text_theme.headlineMedium),
            SizedBox(height: 10),
            Text("fatemeamiri@gmail.com", style: text_theme.headlineMedium),
            SizedBox(height: 40),
            techDivider(size: size),
            InkWell(
              onTap: () {},
              splashColor: SolidColors.primaryColor,
              child: SizedBox(
                height: 45,
                child: Center(
                  child: Text(
                    MyStrings.myFavBlog,
                    style: text_theme.headlineMedium,
                  ),
                ),
              ),
            ),
            techDivider(size: size),
            InkWell(
              onTap: () {},
              splashColor: SolidColors.primaryColor,
              child: SizedBox(
                height: 45,
                child: Center(
                  child: Text(
                    MyStrings.myFavPodcast,
                    style: text_theme.headlineMedium,
                  ),
                ),
              ),
            ),
            techDivider(size: size),
            InkWell(
              onTap: () {},
              splashColor: SolidColors.primaryColor,
              child: SizedBox(
                height: 45,
                child: Center(
                  child: Text(
                    MyStrings.logOut,
                    style: text_theme.headlineMedium,
                  ),
                ),
              ),
            ),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
