import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minimal_app_overlay/page_manager.dart';

class Page1 extends ConsumerWidget {
  const Page1({Key? key}) : super(key: key);
  static const pageKey = ValueKey('page1Key');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('I am Page 1'),
        TextButton(
          onPressed: () {
            ref.read(pageManager).pushPage2();
          },
          child: const Text('Go to Page 2'),
        ),
      ],
    );
  }
}
