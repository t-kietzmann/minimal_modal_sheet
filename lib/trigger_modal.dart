import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final triggerModalProvider = StateProvider<bool>((ref) => false);

class TriggerModal extends ConsumerWidget {
  const TriggerModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Colors.red,
      child: TextButton(
        onPressed: () {
          ref.read(triggerModalProvider.state).state = true;
        },
        child: const Text('Trigger Modal',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )),
      ),
    );
  }
}
