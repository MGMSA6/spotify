import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/widgets/appbar/app_bar.dart';
import 'package:spotify/common/widgets/button/basic_app_button.dart';
import 'package:spotify/core/config/assets/app_vectors.dart';
import 'package:spotify/core/config/theme/app_colors.dart';
import 'package:spotify/presentation/auth/signin.dart';
import 'package:spotify/utils/strings.dart';

class Register extends StatelessWidget {
  const Register({super.key});

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
              const SizedBox(
                height: 10,
              ),
              _supportText(context),
              const SizedBox(
                height: 10,
              ),
              _fullNameField(context),
              const SizedBox(
                height: 20,
              ),
              _emailField(context),
              const SizedBox(
                height: 20,
              ),
              _passwordField(context),
              const SizedBox(
                height: 20,
              ),
              BasicAppButton(onPressed: () {}, title: AppStrings.createAcct)
            ],
          ),
        ),
      ),
    );
  }

  Widget _registerText() {
    return const Text(
      AppStrings.register,
      style: TextStyle(
          fontFamily: AppStrings.satoshi,
          fontWeight: FontWeight.w600,
          fontSize: 30),
      textAlign: TextAlign.center,
    );
  }

  Widget _fullNameField(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(hintText: AppStrings.fullName)
          .applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(hintText: AppStrings.email)
          .applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(hintText: AppStrings.password)
          .applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _supportText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
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
            AppStrings.doHaveAcct,
            style: TextStyle(
              fontFamily: AppStrings.satoshi,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Signin()));
              },
              child: const Text(
                AppStrings.signIn,
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
}
