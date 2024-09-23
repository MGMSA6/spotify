import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/helper/is_dark_mode.dart';
import 'package:spotify/common/widgets/appbar/app_bar.dart';
import 'package:spotify/common/widgets/button/basic_app_button.dart';
import 'package:spotify/core/config/assets/app_images.dart';
import 'package:spotify/core/config/assets/app_vectors.dart';
import 'package:spotify/core/config/theme/app_colors.dart';
import 'package:spotify/presentation/auth/register.dart';
import 'package:spotify/presentation/auth/signin.dart';
import 'package:spotify/utils/strings.dart';

class SignupSignin extends StatelessWidget {
  const SignupSignin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 10),
            child: BasicAppBar(),
          ),
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(AppVectors.topPattern),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(AppVectors.bottomPattern),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(AppImages.authBg),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppVectors.logo),
                  const SizedBox(
                    height: 55,
                  ),
                  const Text(
                    AppStrings.welcomeMessage,
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: AppStrings.satoshi,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 21,
                  ),
                  const Text(
                    AppStrings.signUpText,
                    style: TextStyle(
                        fontSize: 13,
                        fontFamily: AppStrings.satoshi,
                        fontWeight: FontWeight.w600,
                        color: AppColors.grey),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: BasicAppButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Register()));
                              },
                              title: AppStrings.register)),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        flex: 1,
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Signin()));
                            },
                            child: Text(
                              AppStrings.signIn,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: AppStrings.satoshi,
                                  fontWeight: FontWeight.w500,
                                  color: context.isDarkMode
                                      ? Colors.white
                                      : Colors.black),
                            )),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
