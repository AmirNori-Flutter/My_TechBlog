import 'package:flutter/material.dart';
import 'package:techblog/Constants/my_colors.dart';
import 'package:techblog/Constants/my_string.dart';
import 'package:techblog/Models/fake_data.dart';
import 'package:techblog/gen/assets.gen.dart';

class homeScrren extends StatelessWidget {
  const homeScrren({
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
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
        child: Column(
          children: [

            // Poster
            Poster_Image(size: size, text_theme: text_theme),
            SizedBox(height: 18.0),

            // Tag List
            Tag_List(bodyMargin: bodyMargin, text_theme: text_theme),
            SizedBox(height: 32.0),
            
            // SeeMore
            See_More(bodyMargin: bodyMargin, text_theme: text_theme),
    
            // Blog List
            Blog_List(size: size, bodyMargin: bodyMargin, text_theme: text_theme),
    
            // Padcast_More
            Padcast_More(bodyMargin: bodyMargin, text_theme: text_theme),
    
            // Padcast List
            Padcast_List(size: size, bodyMargin: bodyMargin),
            SizedBox(height: 65),
          
          ],
        ),
      ),
    );
  }
}

class Padcast_List extends StatelessWidget {
  const Padcast_List({
    super.key,
    required this.size,
    required this.bodyMargin,
  });

  final Size size;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.5,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: padcastList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              right: index == 0 ? bodyMargin : 15,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: size.height / 5.3,
                    width: size.width / 2.4,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                            image: DecorationImage(
                              image: NetworkImage(
                                padcastList[index].imgUrl,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width / 2.4,
                  child: Text(
                    textAlign: TextAlign.center,
                    padcastList[index].title,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class Padcast_More extends StatelessWidget {
  const Padcast_More({
    super.key,
    required this.bodyMargin,
    required this.text_theme,
  });

  final double bodyMargin;
  final TextTheme text_theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      
      padding: EdgeInsets.only(right: bodyMargin, bottom: 8),
      child: Row(
        children: [
          ImageIcon(
            Assets.icons.voice.provider(),
            color: SolidColors.seeMore,
          ),
          SizedBox(width: 10),
          Text(
            MyStrings.viewHotestPodCasts,
            style: text_theme.displaySmall,
          ),
        ],
      ),
    );
  }
}

class Blog_List extends StatelessWidget {
  const Blog_List({
    super.key,
    required this.size,
    required this.bodyMargin,
    required this.text_theme,
  });

  final Size size;
  final double bodyMargin;
  final TextTheme text_theme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.5,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: blogList.getRange(0, 5).length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              right: index == 0 ? bodyMargin : 15,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: size.height / 5.3,
                    width: size.width / 2.4,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                            image: DecorationImage(
                              image: NetworkImage(
                                blogList[index].imageUrl,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          foregroundDecoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                            gradient: LinearGradient(
                              colors: GradientColors.blogpost,
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                        ),
        
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 22.0,
                          child: Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                blogList[index].writer,
                                style: text_theme.titleMedium,
                              ),
                              Row(
                                children: [
                                  Text(
                                    blogList[index].views,
                                    style:
                                        text_theme.titleMedium,
                                  ),
                                  SizedBox(width: 5.0),
                                  Icon(
                                    Icons.remove_red_eye_sharp,
                                    color: Colors.white38,
                                    size: 16.0,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width / 2.4,
                  child: Text(
                    blogList[index].title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class See_More extends StatelessWidget {
  const See_More({
    super.key,
    required this.bodyMargin,
    required this.text_theme,
  });

  final double bodyMargin;
  final TextTheme text_theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: bodyMargin, bottom: 8),
      child: Row(
        children: [
          ImageIcon(
            Assets.icons.bluepen.provider(),
            color: SolidColors.seeMore,
          ),
          SizedBox(width: 10),
          Text(
            MyStrings.viewHotestBlog,
            style: text_theme.displaySmall,
          ),
        ],
      ),
    );
  }
}

class Tag_List extends StatelessWidget {
  const Tag_List({
    super.key,
    required this.bodyMargin,
    required this.text_theme,
  });

  final double bodyMargin;
  final TextTheme text_theme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.0,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: taglistmodel.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(
              8,
              8,
              index == 0 ? bodyMargin : 15,
              8,
            ),
            child: Container(
              height: 60.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(24.0),
                ),
                gradient: LinearGradient(
                  colors: GradientColors.tags,
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  18,
                  8,
                  18,
                  8,
                ),
                child: Row(
                  children: [
                    ImageIcon(
                      Assets.icons.hashtag.provider(),
                      color: Colors.white,
                      size: 16.0,
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      taglistmodel[index].title,
                      style: text_theme.displayMedium,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Poster_Image extends StatelessWidget {
  const Poster_Image({
    super.key,
    required this.size,
    required this.text_theme,
  });

  final Size size;
  final TextTheme text_theme;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: size.width / 1.19,
          height: size.height / 4.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(16.0),
            ),
            image: DecorationImage(
              image: homePagePosterMap["imageAssets"],
              fit: BoxFit.cover,
            ),
          ),
          foregroundDecoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(16.0),
            ),
            gradient: LinearGradient(
              colors: GradientColors.homeposterGradient,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        
        Positioned(
          left: 0,
          right: 0,
          bottom: 22.0,
          child: Column(
            children: [
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    homePagePosterMap["writer"] +
                        "  -  " +
                        homePagePosterMap["date"],
                    style: text_theme.titleMedium,
                  ),
                  Row(
                    children: [
                      Text(
                        homePagePosterMap["views"],
                        style: text_theme.titleMedium,
                      ),
                      SizedBox(width: 5.0),
                      Icon(
                        Icons.remove_red_eye_sharp,
                        color: Colors.white38,
                        size: 16.0,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 15.0),
              Text(
                homePagePosterMap["title"],
                style: text_theme.displayLarge,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
