import 'package:flutter/material.dart';

class TabItem {
  final String _title;
  final IconData _icon;

  TabItem(this._title, this._icon);

  String getTitle() => _title;
  IconData getIcon() => _icon;
}
