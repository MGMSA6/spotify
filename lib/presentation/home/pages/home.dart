import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/widgets/appbar/app_bar.dart';
import 'package:spotify/core/config/assets/app_images.dart';
import 'package:spotify/core/config/assets/app_vectors.dart';
import 'package:spotify/core/config/theme/app_colors.dart';
import 'package:spotify/utils/strings.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
        hideBack: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _homeArtistCard(),
          ],
        ),
      ),
    );
  }

  Widget _homeArtistCard() {
    return Center(
      child: Container(
        padding: const EdgeInsets.only(left: 20),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        height: 100,
        width: double.maxFinite,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: AppColors.primary),
        child: Stack(
          children: [
            const Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "New album",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontFamily: AppStrings.satoshi,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "Happier Than\nEver",
                  style: TextStyle(color: Colors.white, fontSize: 19),
                ),
                Text(
                  "Billie Eilish",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontFamily: AppStrings.satoshi,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: OverflowBox(
                maxWidth: double.infinity,
                maxHeight: 183,
                child: Image.asset(
                  AppImages.homeArtist,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
