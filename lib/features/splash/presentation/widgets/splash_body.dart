import 'package:go_router/go_router.dart';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/themes/light_theme.dart';
import '../../../../core/themes/text_style.dart';
import '../../../../core/utils/constants.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    goToHome();
  }

  void goToHome() {
    Future.delayed(const Duration(seconds: 4), () {
      // ignore: use_build_context_synchronously
      GoRouter.of(context).pushReplacement('/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Center(
      child: Column(
        spacing: 20,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Logo
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.1),
            child: Container(
              alignment: Alignment.center,
              height: 200,
              decoration: BoxDecoration(
                color: MyColors.bg,
                borderRadius: BorderRadius.circular(30),
              ),
              child: LottieBuilder.asset(Constants.intro, fit: BoxFit.fill),
            ),
          ),
          const SizedBox(height: 20),
          // Animation Text
          Text(
            'الفرقان',
            style: MyStyle.title28(context),
            textAlign: TextAlign.center,
          ),
          Text(
            'وَقُل رَّبِّ زِدْنِي عِلْمًا (طه: ١١٤)',
            style: MyStyle.splash18(context),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
