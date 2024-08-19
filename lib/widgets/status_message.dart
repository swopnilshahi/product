import 'package:flutter/material.dart';

class StatusMessage extends StatelessWidget {
  const StatusMessage(
      {super.key,
      required this.message,
      required this.bannerMessage,
      required this.bannerColor,
      required this.textColor});

  final String message;
  final String bannerMessage;
  final Color bannerColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Banner(message: bannerMessage, color: bannerColor, location: BannerLocation.topStart,textStyle: TextStyle(color: textColor),),
        Center(

          child: Container(
            margin: const EdgeInsets.only(top: 48),
            padding: const EdgeInsets.all(24),
            child: Text(message,style: Theme.of(context).textTheme.headlineLarge,),
          ),
        )
      ],
    );
  }
}
