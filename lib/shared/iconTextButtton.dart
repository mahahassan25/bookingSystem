import 'package:flutter/material.dart';

Widget iconTextButton(
    {required Color background,
      required IconData iconp,
      required String text,
      required BuildContext context,
      required Color iconColor,
      required Color textColor,
      required VoidCallback function}) =>
    Container(
      width: 100,
      height: 50,
      decoration: BoxDecoration(

        color: background,
        border: Border.all(color: Colors.grey,width: 1,),
        borderRadius: BorderRadius.circular(
          15,
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: TextButton.icon(
        onPressed: function,
        icon: Icon(
          iconp,
          color: iconColor,
          size: 30,
        ),
        label: Text(
          '$text',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: textColor,
          ),
        ),
      ),
    );