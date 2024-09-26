import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/helper/is_dark_mode.dart';
import 'package:spotify/common/widgets/appbar/app_bar.dart';
import 'package:spotify/common/widgets/button/basic_app_button.dart';
import 'package:spotify/core/config/assets/app_vectors.dart';
import 'package:spotify/core/config/theme/app_colors.dart';
import 'package:spotify/data/models/signin_user_req.dart';
import 'package:spotify/domain/usecases/signin_usecase.dart';
import 'package:spotify/presentation/auth/register.dart';
import 'package:spotify/presentation/home/pages/home.dart';
import 'package:spotify/service_locator.dart';
import 'package:spotify/utils/strings.dart';

class Signin extends StatelessWidget {
  Signin({super.key});

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _signText(context),
      appBar: BasicAppBar(
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _registerText(),
              _supportText(context),
              const SizedBox(
                height: 10,
              ),
              _emailField(context),
              const SizedBox(
                height: 20,
              ),
              _passwordField(context),
              const SizedBox(
                height: 10,
              ),
              _recoverPasswordText(),
              const SizedBox(
                height: 20,
              ),
              BasicAppButton(
                  onPressed: () async {
                    var result = await sl<SigninUsecase>().call(
                        params: SigninUserReq(
                            email: _email.text.toString(),
                            password: _password.text.toString()));

                    result.fold((l) {
                      var snackBar = SnackBar(content: Text(l));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }, (r) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()),
                          (root) => false);
                    });
                  },
                  title: AppStrings.signIn),
              const SizedBox(
                height: 20,
              ),
              _seperator(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _registerText() {
    return const Text(
      AppStrings.signIn,
      style: TextStyle(
          fontFamily: AppStrings.satoshi,
          fontWeight: FontWeight.w600,
          fontSize: 30),
      textAlign: TextAlign.center,
    );
  }

  Widget _recoverPasswordText() {
    return Align(
        alignment: Alignment.centerLeft,
        child: TextButton(
          onPressed: () {},
          child: const Text(
            AppStrings.recoverPassword,
            style: TextStyle(
                fontFamily: AppStrings.satoshi,
                fontWeight: FontWeight.w500,
                fontSize: 14),
            textAlign: TextAlign.left,
          ),
        ));
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      controller: _email,
      decoration: const InputDecoration(hintText: AppStrings.userName)
          .applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      controller: _password,
      decoration: const InputDecoration(hintText: AppStrings.password)
          .applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _supportText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            AppStrings.support,
            style: TextStyle(
              fontFamily: AppStrings.satoshi,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          TextButton(
              onPressed: () {},
              child: const Text(
                AppStrings.click,
                style: TextStyle(
                    fontFamily: AppStrings.satoshi,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: AppColors.primary),
              ))
        ],
      ),
    );
  }

  Widget _signText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            AppStrings.notAMember,
            style: TextStyle(
              fontFamily: AppStrings.satoshi,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          TextButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Register()));
              },
              child: const Text(
                AppStrings.registerNow,
                style: TextStyle(
                    fontFamily: AppStrings.satoshi,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: AppColors.textBlue),
              ))
        ],
      ),
    );
  }

  Widget _seperator(BuildContext context) {
    return Column(children: [
      Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: 2.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    context.isDarkMode
                        ? AppColors.separate1
                        : AppColors.separate3,
                    context.isDarkMode
                        ? AppColors.separate2
                        : AppColors.separate4,
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              "Or",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 2.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    context.isDarkMode
                        ? AppColors.separate1
                        : AppColors.separate3,
                    context.isDarkMode
                        ? AppColors.separate2
                        : AppColors.separate4,
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(AppVectors.google),
          context.isDarkMode
              ? SvgPicture.asset(AppVectors.appleWhite)
              : SvgPicture.asset(AppVectors.appleBlack)
        ],
      )
    ]);
  }
}
