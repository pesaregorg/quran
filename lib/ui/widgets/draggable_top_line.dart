import 'package:flutter/material.dart';

class DraggableTopLine extends StatelessWidget {
  const DraggableTopLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: 3,
        width: 30,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(2.0)),
          color: Theme.of(context).dividerColor.withAlpha(80),
        ),
      ),
    );
  }
}
