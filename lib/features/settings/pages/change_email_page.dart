import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/features/settings/providers/settings_provider.dart';
import 'package:smart_home_app/features/settings/widgets/change_email_app_bar.dart';
import 'package:smart_home_app/utils/managers/asset_manager.dart';
import 'package:smart_home_app/utils/managers/color_manager.dart';
import 'package:smart_home_app/utils/managers/string_manager.dart';
import 'package:smart_home_app/utils/managers/value_manager.dart';
import 'package:smart_home_app/utils/widgets/lime_green_rounded_button.dart';
import 'package:smart_home_app/utils/widgets/text_field_widget.dart';

class ChangeEmailPage extends StatefulWidget {
  const ChangeEmailPage({super.key});

  @override
  State<ChangeEmailPage> createState() => _ChangeEmailPageState();
}

class _ChangeEmailPageState extends State<ChangeEmailPage> {
  final TextEditingController _oldEmailController = TextEditingController();
  final TextEditingController _newEmailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final settingsProvider =
        Provider.of<SettingsProvider>(context, listen: false);
    Future<void> changeEmail() async {
      if (isValid) {
        try {
          await settingsProvider.changeEmail(
            context: context,
            oldEmail: _oldEmailController.text,
            newEmail: _newEmailController.text,
            password: _passwordController.text,
          );
        } catch (e) {
          print(e);
        }
      }
    }

    return Scaffold(
      backgroundColor: ColorManager.darkGrey,
      appBar: const PreferredSize(
        preferredSize: Size(
          double.infinity,
          SizeManager.s60,
        ),
        child: ChangeEmailPageAppBar(),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: SizeManager.s250,
                height: SizeManager.s250,
                child: Image.asset(
                  ImageManager.logo,
                ),
              ),
              TextFieldWidget(
                controller: _oldEmailController,
                labelHint: StringsManager.oldEmailHint,
                obscureText: false,
              ),
              TextFieldWidget(
                controller: _newEmailController,
                labelHint: StringsManager.newEmailHint,
                obscureText: false,
              ),
              TextFieldWidget(
                controller: _passwordController,
                labelHint: StringsManager.passwordHint,
                obscureText: true,
              ),
              LimeGreenRoundedButtonWidget(
                onTap: changeEmail,
                title: StringsManager.procede,
              )
            ],
          ),
        ),
      )),
    );
  }

  bool get isValid {
    return _oldEmailController.text.isNotEmpty ||
        _newEmailController.text.isNotEmpty ||
        _passwordController.text.isNotEmpty ||
        _oldEmailController != _newEmailController;
  }
}
