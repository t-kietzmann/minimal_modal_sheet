import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minimal_app_overlay/my_modal_overlay.dart';
import 'package:minimal_app_overlay/page_manager.dart';
import 'package:minimal_app_overlay/trigger_modal.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Scaffold(
        bottomNavigationBar: const TriggerModal(),
        body: Consumer(builder: (context, ref, child) {
          return MyModalOverlay(
            isLoading: ref.watch(triggerModalProvider),
            child: const MainNavigation(),
          );
        }),
      ),
    );
  }
}
