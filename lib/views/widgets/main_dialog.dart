import 'package:flutter/material.dart';

class MainDialog {
  final BuildContext context;
  final String content;
  final String title;
  final List<Map<String, void Function()?>>? actions;

  MainDialog(
      {required this.context,
      required this.content,
      required this.title,
      this.actions});

  showAlertDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        content: Text(
          content,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        actions: (Actions != null)
            ? actions
                ?.map((action) => TextButton(
                    onPressed: action.values.first,
                    child: Text(action.keys.first)))
                .toList()
            : [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('ok'),
                )
              ],
      ),
    );
  }
}
