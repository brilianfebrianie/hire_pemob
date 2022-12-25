import 'package:flutter/material.dart';

class PopUpDialog extends StatelessWidget {
  const PopUpDialog(
      {Key? key,
      required this.contentTitle,
      required this.contentBody,
      required this.function})
      : super(key: key);

  final String contentTitle;
  final String contentBody;
  final Function() function;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      titlePadding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      contentPadding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
      title: const Icon(
        Icons.check_circle_outline,
        size: 50,
        color: Color.fromARGB(255, 46, 117, 211),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            contentTitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Text(
              contentBody,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
      actions: <Widget>[
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          alignment: Alignment.center,
          child: InkWell(
            onTap: function,
            child: Ink(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 217, 217, 217),
                  borderRadius: BorderRadius.circular(4)),
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              child: const Text(
                "Next",
                style: TextStyle(
                    fontFamily: 'Montserrat', fontWeight: FontWeight.w600),
              ),
            ),
          ),
        )
      ],
    );
  }
}
