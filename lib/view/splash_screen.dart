import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:techblog/Constants/my_colors.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/view/mainscrren.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    
    Future.delayed(Duration(milliseconds: 5000)).then((value) {

      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
        return Mainscrren();
      },),);


    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: Assets.images.splash.provider(),height: 64),
            SizedBox(height: 40),
            SpinKitFoldingCube(
              color: SolidColors.primaryColor,
              size: 35.0,
            ),
          ],
        ),
      ),
    ),
    );
  }
}
