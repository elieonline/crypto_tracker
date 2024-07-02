import 'package:crypto_tracker/core/utils/custom_icons.dart';
import 'package:flutter/material.dart';

AppBar dashAppBar() {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.transparent,
    leading: IconButton(
      onPressed: () {},
      icon: const Icon(BIcons.user, size: 20),
    ),
    actions: [
      IconButton(
        onPressed: () {},
        constraints: const BoxConstraints(maxWidth: 0),
        icon: const Icon(BIcons.notification_bing, size: 20),
      ),
      IconButton(
        onPressed: () {},
        icon: const Icon(BIcons.setting, size: 20),
      ),
    ],
  );
}
