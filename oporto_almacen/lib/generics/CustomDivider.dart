import 'package:flutter/material.dart';
import 'package:oporto_almacen/helpers/ui_helper.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 15,
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                height: 2,
                color: Colors.black,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(3),
              margin: const EdgeInsets.symmetric(horizontal: 1),
              height: UiHelper.getOrientation(context) == Orientation.portrait
                  ? UiHelper.getHeight(context) * 0.02
                  : UiHelper.getWidth(context) * 0.02,
              width: UiHelper.getOrientation(context) == Orientation.portrait
                  ? UiHelper.getHeight(context) * 0.02
                  : UiHelper.getWidth(context) * 0.02,
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Container(
                height: UiHelper.getHeight(context) * 0.01,
                width: UiHelper.getHeight(context) * 0.01,
                decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                height: 2,
                color: Colors.black,
              ),
            )
          ],
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
