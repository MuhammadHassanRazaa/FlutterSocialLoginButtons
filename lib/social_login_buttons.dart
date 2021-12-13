library social_login_button;

export 'package:social_login_buttons/social_login_buttons.dart'
    show SocialLoginButton, SocialLoginButtonType, SocialLoginButtonMode;

import 'package:flutter/material.dart';

/// All Supported Button Types
enum SocialLoginButtonType {
  /// Facebook
  facebook,

  /// Google
  google,

  /// Twitter
  twitter,

  /// Apple
  apple,

  /// Appple (with black logo)
  appleBlack,

  /// Microsoft
  microsoft,

  /// Microsoft (with black logo)
  microsoftBlack,

  /// Github
  github,

  /// General Logo, wihtout any image, default text is 'Sign In'
  generalLogin
}

/// All SUpported Button Modes
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
    this.disabledBackgroundColor,
    this.textColor,
    this.height = 55.0,
    this.borderRadius = 4.0,
    this.fontSize = 15.0,
    this.width,
    this.imageWidth = 45,
    this.mode = SocialLoginButtonMode.multi,
  }) : super(key: key);

  /// Default URL for images used in the package.
  static const String _imageURL =
      'https://github.com/MuhammadHassanRazaa/FlutterSocialLoginButtons/raw/master/images/';

  /// Buton Type
  final SocialLoginButtonType buttonType;

  /// Action onPressed
  final VoidCallback onPressed;

  /// Image URL, an optional param can be used to override defualt image.
  String? imagePath;

  /// Buton text, an optional param can be used to override defualt text
  String? text;

  /// Background Color, an optional param can be used to override defualt
  /// background color.
  Color? backgroundColor;

  /// Text Color, an optional param can be used to override defualt text color.
  Color? textColor;

  /// Height, an optional param can be used to override defualt height of button,
  /// which is 55.0
  double? height;

  /// Border Radius text, an optional param can be used to override defualt
  /// border radius, which is 4.0.
  double? borderRadius;

  /// Font Size, an optional param can be used to override defualt font size,
  /// which is 15.0
  double? fontSize;

  /// Width, an optional param can be used to override defualt button Width.
  double? width;

  /// Image Width, an optional param can be used to override defualt button
  /// image width which is 45.0.
  double? imageWidth;

  /// Grey out color, an optional param can be used to override defualt
  /// background Color when button is in disbaled state.
  Color? disabledBackgroundColor;

  /// Button Mode, an otpional param, can be used to create single style button.
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
        imageName = _imageURL + "facebook-logo.png";
        backgroundColor = const Color(0xFF334D92);
        break;
      case SocialLoginButtonType.google:
        color = Colors.black87;
        text = "Sign In with Google";
        imageName = _imageURL + "google-logo.png";
        backgroundColor = Colors.white;
        break;
      case SocialLoginButtonType.twitter:
        color = Colors.white;
        text = "Sign In with Twitter";
        imageName = _imageURL + "twitter-logo.png";
        backgroundColor = const Color(0xFF1DA1F2);
        break;
      case SocialLoginButtonType.apple:
        color = Colors.black;
        text = "Sign In with Apple";
        imageName = _imageURL + "apple-logo.png";
        backgroundColor = Colors.white;
        break;
      case SocialLoginButtonType.appleBlack:
        color = Colors.white;
        text = "Sign In with Apple";
        imageName = _imageURL + "apple-black-logo.png";
        backgroundColor = Colors.black;
        break;
      case SocialLoginButtonType.microsoft:
        color = const Color(0xFF5E5E5E);
        text = "Sign In with Microsoft";
        imageName = _imageURL + "microsoft-logo.png";
        backgroundColor = Colors.white;
        break;
      case SocialLoginButtonType.microsoftBlack:
        color = Colors.white;
        text = "Sign In with Microsoft";
        imageName = _imageURL + "microsoft-logo.png";
        backgroundColor = const Color(0xFF2F2F2F);
        break;
      case SocialLoginButtonType.github:
        color = const Color(0xFFFEFEFE);
        text = "Sign In with Github";
        imageName = _imageURL + "github-logo.png";
        backgroundColor = const Color(0xFF444444);
        break;
      case SocialLoginButtonType.generalLogin:
        color = Colors.white;
        text = "Sign In";
        backgroundColor = Colors.teal[700];
    }
    return _LoginButton(
      imageURL: imageName,
      text: this.text ?? text,
      color: textColor ?? color,
      backgroundColor: this.backgroundColor ?? backgroundColor,
      disabledBackgroundColor: disabledBackgroundColor,
      onPressed: onPressed,
      height: height!,
      fontSize: fontSize!,
      borderRadius: borderRadius!,
      mode: mode!,
      width: width,
      imageWidth: imageWidth,
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({
    Key? key,
    required this.imageURL,
    required this.text,
    required this.color,
    this.backgroundColor = Colors.blueAccent,
    this.disabledBackgroundColor,
    required this.height,
    required this.borderRadius,
    required this.fontSize,
    required this.onPressed,
    required this.mode,
    this.width,
    this.imageWidth,
  }) : super(key: key);

  final String? imageURL;
  final String text;
  final Color color;
  final Color? backgroundColor;
  final Color? disabledBackgroundColor;
  final double height;
  final double? width;
  final double? imageWidth;
  final double borderRadius;
  final double fontSize;
  final VoidCallback onPressed;
  final SocialLoginButtonMode mode;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: height,
        width: width,
        child: ElevatedButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              createImageChildren(imageURL),
              Text(
                mode == SocialLoginButtonMode.multi ? text : ' Sign In',
                style: TextStyle(color: color, fontSize: fontSize),
              ),
              Opacity(
                opacity: 0.0,
                child: createImageChildren(imageURL, mode: mode),
              ),
            ],
          ),
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(borderRadius),
                ),
              ),
            ),
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return disabledBackgroundColor ?? backgroundColor!;
                }
                return backgroundColor!;
              },
            ),
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }

  createImageChildren(String? imageUrl, {SocialLoginButtonMode? mode}) {
    if (mode == null || mode == SocialLoginButtonMode.multi) {
      return imageUrl == null
          ? Column()
          : Image.network(
              imageUrl,
              width: imageWidth,
            );
    }
    return Column();
  }
}
