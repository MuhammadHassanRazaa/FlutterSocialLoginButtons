import 'package:flutter/material.dart';
import 'package:social_login_buttons/social_login_button.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
    required this.imageName,
    required this.text,
    required this.color,
    this.backgroundColor = Colors.blueAccent,
    this.disabledBackgroundColor = Colors.grey,
    required this.height,
    required this.borderRadius,
    required this.fontSize,
    required this.onPressed,
    required this.mode,
  }) : super(key: key);

  final String? imageName;
  final String text;
  final Color color;
  final Color? backgroundColor;
  final Color? disabledBackgroundColor;
  final double height;
  final double borderRadius;
  final double fontSize;
  final VoidCallback onPressed;
  final SocialLoginButtonMode mode;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            createImageChildren(imageName),
            Text(
              mode == SocialLoginButtonMode.multi ? text : 'Sign In',
              style: TextStyle(color: color, fontSize: fontSize),
            ),
            Opacity(
              opacity: 0.0,
              child: createImageChildren(imageName, mode: mode),
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
                return disabledBackgroundColor!;
              }
              return backgroundColor!;
            },
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }

  createImageChildren(String? imageName, {SocialLoginButtonMode? mode}) {
    if (mode == null || mode == SocialLoginButtonMode.multi) {
      return imageName == null ? Column() : Image.asset(imageName);
    }
    return Column();
  }
}
