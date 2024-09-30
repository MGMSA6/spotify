import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/helper/is_dark_mode.dart';
import 'package:spotify/common/widgets/appbar/app_bar.dart';
import 'package:spotify/core/config/assets/app_images.dart';
import 'package:spotify/core/config/assets/app_vectors.dart';
import 'package:spotify/core/config/theme/app_colors.dart';
import 'package:spotify/utils/strings.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

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
          children: [_homeArtistCard(), _tabs()],
        ),
      ),
    );
  }

  Widget _homeArtistCard() {
    return Center(
      child: Container(
        padding: const EdgeInsets.only(left: 20),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        height: 140,
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColors.primary,
        ),
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
                ),
              ],
            ),
            // Positioned union image to the right
            Positioned(
              right: 0, // Aligns to the right side
              bottom: 0, // Aligns to the bottom
              child: SvgPicture.asset(
                AppVectors.union,
                fit: BoxFit.contain,
                height: 135,
              ),
            ),
            // Positioned homeArtist image after the union image
            Positioned(
              right:
                  30, // Adjust the right alignment to position it after union
              bottom: 0, // Aligns to the bottom
              child: Image.asset(
                AppImages.homeArtist,
                fit: BoxFit.fill,
                height: 160, // Adjust image size if necessary
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tabs() {
    return TabBar(
        controller: tabController,
        labelColor: context.isDarkMode ? Colors.white : Colors.black,
        indicatorColor: AppColors.primary,
        indicatorWeight: 3,
        dividerColor: Colors.transparent,
        isScrollable: true,
        labelStyle: const TextStyle(
          fontSize: 20,
          fontFamily: AppStrings.satoshi,
          fontWeight: FontWeight.w600,
        ),
        labelPadding: const EdgeInsets.symmetric(horizontal: 20),
        tabs: const [
          Tab(
            text: 'News',
          ),
          Tab(
            text: 'Video',
          ),
          Tab(
            text: 'Artists',
          ),
          Tab(
            text: 'Podcast',
          ),
        ]);
  }
}
