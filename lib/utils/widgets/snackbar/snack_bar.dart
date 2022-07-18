import 'package:flutter/material.dart';
import 'package:asuka/asuka.dart' as asuka;

class SnackBarCustom {
  static void success(String text) {
    asuka.showSnackBar(SnackBar(
      duration: const Duration(milliseconds: 2300),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.green,
      content: Row(children: [
        const Icon(
          Icons.check_circle_outline,
          color: Colors.white,
        ),
        const SizedBox(
          width: 12,
        ),
        Flexible(
          child: Text(
            text,
            overflow: TextOverflow.clip,
          ),
        ),
      ]),
    ));
  }
}
