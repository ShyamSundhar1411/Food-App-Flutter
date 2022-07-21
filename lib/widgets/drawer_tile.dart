import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class DrawerTileWidget extends StatelessWidget {
  final String toDisplay;
  final IconData icon;
  final Function onTapHandler;
  DrawerTileWidget(this.toDisplay, this.icon,this.onTapHandler);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 26),
      title: Text('${toDisplay}',
          style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          )),
      onTap: onTapHandler,
    );
  }
}
