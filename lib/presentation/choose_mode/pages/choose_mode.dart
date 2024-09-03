import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/widgets/button/basic_app_button.dart';
import 'package:spotify/core/config/assets/app_images.dart';
import 'package:spotify/core/config/assets/app_vectors.dart';
import 'package:spotify/core/config/theme/app_colors.dart';
import 'package:spotify/presentation/choose_mode/bloc/theme_cubit.dart';
import 'package:spotify/utils/strings.dart';

class ChooseModePage extends StatelessWidget {
  const ChooseModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      AppImages.chooseModeBG,
                    ))),
          ),
          Container(
            color: Colors.black.withOpacity(0.15),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset(AppVectors.logo),
                ),
                const Spacer(),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  AppStrings.chooseMode,
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontFamily: 'Satoshi',
                    fontWeight: FontWeight.w600, // Medium weight
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            context
                                .read<ThemeCubit>()
                                .updateTheme(ThemeMode.dark);
                          },
                          child: ClipOval(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                    color: const Color(0xff30393c)
                                        .withOpacity(0.5),
                                    shape: BoxShape.circle),
                                child: SvgPicture.asset(
                                  AppVectors.dark,
                                  fit: BoxFit.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          AppStrings.darkMode,
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Satoshi',
                              color: AppColors.textColorGrey,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            context
                                .read<ThemeCubit>()
                                .updateTheme(ThemeMode.light);
                          },
                          child: ClipOval(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                    color: const Color(0xff30393c)
                                        .withOpacity(0.5),
                                    shape: BoxShape.circle),
                                child: SvgPicture.asset(
                                  AppVectors.light,
                                  fit: BoxFit.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          AppStrings.lightMode,
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Satoshi',
                              color: AppColors.textColorGrey,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                BasicAppButton(
                    onPressed: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (BuildContext context) =>
                      //             const ChooseModePage()));
                    },
                    title: AppStrings.continueTxt)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
