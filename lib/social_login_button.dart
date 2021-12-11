import 'package:flutter/material.dart';
import 'package:social_login_buttons/login_button.dart';

enum SocialLoginButtonType {
  facebook,
  google,
  twitter,
  apple,
  appleBlack,
  microsoft,
  microsoftBlack,
  github,
  generalLogin
}

enum SocialLoginButtonMode { single, multi }

// ignore: must_be_immutable
class SocialLoginButton extends StatelessWidget {
  SocialLoginButton({
    Key? key,
    required this.buttonType,
    required this.onPressed,
    this.imagePath,
    this.text,
    this.backgroundColor,
    this.textColor,
    this.height = 55.0,
    this.borderRadius = 4.0,
    this.fontSize = 15.0,
    this.mode = SocialLoginButtonMode.multi,
  }) : super(key: key);

  final SocialLoginButtonType buttonType;
  final VoidCallback onPressed;
  String? imagePath;
  String? text;
  Color? backgroundColor;
  Color? textColor;
  double? height;
  double? borderRadius;
  double? fontSize;
  SocialLoginButtonMode? mode;

  @override
  Widget build(BuildContext context) {
    Color? color;
    String? imageName;
    String? text;
    Color? backgroundColor;

    switch (buttonType) {
      case SocialLoginButtonType.facebook:
        color = Colors.white;
        text = "Sign In with Facebook";
        imageName = "images/facebook-logo.png";
        backgroundColor = const Color(0xFF334D92);
        break;
      case SocialLoginButtonType.google:
        color = Colors.black87;
        text = "Sign In with Google";
        imageName = "images/google-logo.png";
        backgroundColor = Colors.white;
        break;
      case SocialLoginButtonType.twitter:
        color = Colors.white;
        text = "Sign In with Twitter";
        imageName = "images/twitter-logo.png";
        backgroundColor = const Color(0xFF1DA1F2);
        break;
      case SocialLoginButtonType.apple:
        color = Colors.black;
        text = "Sign In with Apple";
        imageName = "images/apple-logo.png";
        backgroundColor = Colors.white;
        break;
      case SocialLoginButtonType.appleBlack:
        color = Colors.white;
        text = "Sign In with Apple";
        imageName = "images/apple-black-logo.png";
        backgroundColor = Colors.black;
        break;
      case SocialLoginButtonType.microsoft:
        color = const Color(0xFF5E5E5E);
        text = "Sign In with Microsoft";
        imageName = "images/microsoft-logo.png";
        backgroundColor = Colors.white;
        break;
      case SocialLoginButtonType.microsoftBlack:
        color = Colors.white;
        text = "Sign In with Microsoft";
        imageName = "images/microsoft-logo.png";
        backgroundColor = const Color(0xFF2F2F2F);
        break;
      case SocialLoginButtonType.github:
        color = const Color(0xFFFEFEFE);
        text = "Sign In with Github";
        imageName = "images/github-logo.png";
        backgroundColor = const Color(0xFF444444);
        break;
      case SocialLoginButtonType.generalLogin:
        color = Colors.white;
        text = "Sign In";
        backgroundColor = Colors.teal[700];
    }
    return LoginButton(
      imageName: imageName,
      text: this.text ?? text,
      color: textColor ?? color,
      backgroundColor: this.backgroundColor ?? backgroundColor,
      onPressed: onPressed,
      height: height!,
      fontSize: fontSize!,
      borderRadius: borderRadius!,
      mode: mode!,
    );
  }
}
