import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minimal_app_overlay/page_manager.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);
  static const pageKey = ValueKey('homePageKey');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('I am the HomePage!'),
        TextButton(
          onPressed: () {
            ref.read(pageManager).pushPage1();
          },
          child: const Text('Go to Page 1'),
        ),
      ],
    );
  }
}
