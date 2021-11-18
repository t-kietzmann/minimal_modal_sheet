import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minimal_app_overlay/page_manager.dart';

class Page3 extends ConsumerWidget {
  const Page3({Key? key}) : super(key: key);
  static const pageKey = ValueKey('page3Key');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('I am Page 3!'),
        TextButton(
          onPressed: () {
            ref.read(pageManager).goHome();
          },
          child: const Text('Go Home!!'),
        ),
      ],
    );
  }
}
