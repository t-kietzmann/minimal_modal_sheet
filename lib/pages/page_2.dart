import 'package:flutter/material.dart';
import 'package:minimal_app_overlay/page_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Page2 extends ConsumerWidget {
  const Page2({Key? key}) : super(key: key);
  static const pageKey = ValueKey('page2Key');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('I am the Page2!'),
        TextButton(
          onPressed: () {
            ref.read(pageManager).pushPage3();
          },
          child: const Text('Go to Page 3'),
        ),
      ],
    );
  }
}
