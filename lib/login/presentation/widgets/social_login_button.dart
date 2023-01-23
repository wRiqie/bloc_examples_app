// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SocialLoginButton extends StatelessWidget {
  final String icon;
  final VoidCallback onTap;
  const SocialLoginButton({
    Key? key,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey.shade800,
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(15),
          height: 70,
          width: 70,
          child: Image.asset(
            icon,
            height: 10,
          ),
        ),
      ),
    );
  }
}
