import 'package:flutter/material.dart';
import 'package:reddit_clone/gen/assets.gen.dart';

class EmptyListWidget extends StatelessWidget {
  final String title;
  const EmptyListWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: <Widget>[
        const SizedBox(
          height: 40.0,
        ),
        Assets.svg.emptyProd.svg(
          width: MediaQuery.of(context).size.width * 0.6,
        ),
        const SizedBox(
          height: 40.0,
        ),
        Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black.withOpacity(0.75),
              fontSize: 14.5,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.3,
            ),
          ),
        ),
      ],
    );
  }
}
