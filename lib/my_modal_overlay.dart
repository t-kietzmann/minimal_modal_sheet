import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minimal_app_overlay/page_manager.dart';
import 'package:minimal_app_overlay/trigger_modal.dart';

class MyModalOverlay extends StatelessWidget {
  const MyModalOverlay({
    Key? key,
    required this.isLoading,
    required this.child,
  }) : super(key: key);
  final bool isLoading;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      progressIndicator: const CustomModalSheet(),
      color: Colors.transparent,
      isLoading: isLoading,
      opacity: 0.5,
      child: child,
    );
  }
}

class CustomModalSheet extends ConsumerWidget {
  const CustomModalSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        width: MediaQuery.of(context).size.width - 50,
        height: MediaQuery.of(context).size.height - 100,
        color: Colors.blue,
        child: Align(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Cool Modal Sheet'),
              TextButton(
                onPressed: () {
                  ref.read(triggerModalProvider.state).state = false;

                  ref.read(pageManager).goHome();
                },
                child: Text(
                  'Go Home and do something!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).textScaleFactor * 15),
                ),
              ),
            ],
          ),
        ));
  }
}
