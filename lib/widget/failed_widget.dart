import 'package:flutter/material.dart';
import 'package:reddit_clone/gen/assets.gen.dart';

class FailedWidget extends StatelessWidget {
  final String title;
  final VoidCallback onRetry;

  const FailedWidget({
    Key? key,
    required this.title,
    required this.onRetry,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Assets.svg.retry.svg(
          width: size.width * 0.6,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          overflow: TextOverflow.clip,
          style: TextStyle(
            color: Colors.black.withOpacity(0.9),
            fontSize: 14.5,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.3,
          ),
        ),
        const SizedBox(
          height: 15.0,
        ),
        SizedBox(
          height: 38.0,
          width: size.width * 0.5,
          child: ElevatedButton(
            onPressed: onRetry,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            child: const Text(
              'Tekrar dene',
              style: TextStyle(
                color: Colors.white,
                fontSize: 13.5,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.3,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
