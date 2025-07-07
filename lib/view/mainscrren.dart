import 'package:flutter/material.dart';
import 'package:techblog/Constants/my_colors.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/view/home_scrren.dart';
import 'package:techblog/view/profile_scrren.dart';

class Mainscrren extends StatefulWidget {
  const Mainscrren({super.key});

  @override
  State<Mainscrren> createState() => _MainscrrenState();
}

class _MainscrrenState extends State<Mainscrren> {
  var selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    var text_theme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10.0;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: SolidColors.scaffoldBg,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.menu, color: Colors.black),
              Image(
                image: Assets.images.splash.provider(),
                height: size.height / 13.6,
              ),
              Icon(Icons.search, color: Colors.black),
            ],
          ),
        ),
        body: Stack(
          children: [
            Center(
              child: Positioned.fill(
                child: IndexedStack(
                  index: selectedPageIndex,
                  children: [
                    homeScrren(
                      size: size,
                      text_theme: text_theme,
                      bodyMargin: bodyMargin,
                    ),
                    ProfileScrren(
                      size: size,
                      text_theme: text_theme,
                      bodyMargin: bodyMargin,
                    ),
                  ],
                ),
              ),
            ),

            BottomNav(
              size: size,
              bodyMargin: bodyMargin,
              changePage: (int value) {
                setState(() {
                  selectedPageIndex = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNav extends StatelessWidget {
  const BottomNav({
    super.key,
    required this.size,
    required this.bodyMargin,
    required this.changePage,
  });

  final Size size;
  final double bodyMargin;
  final Function(int) changePage;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      left: 0,
      bottom: 0,
      child: Container(
        height: size.height / 10,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: GradientColors.bottomNavBackground,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
          child: Container(
            height: size.height / 8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(18)),
              gradient: LinearGradient(colors: GradientColors.bottomNav),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    changePage(0);
                  },
                  icon: ImageIcon(
                    Assets.icons.home.provider(),
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: ImageIcon(
                    Assets.icons.writer.provider(),
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    changePage(1);
                  },
                  icon: ImageIcon(
                    Assets.icons.user.provider(),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
