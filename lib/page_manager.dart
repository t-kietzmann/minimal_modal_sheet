import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minimal_app_overlay/pages/home_page.dart';
import 'package:minimal_app_overlay/pages/page_2.dart';
import 'package:minimal_app_overlay/pages/page_3.dart';

import 'pages/page_1.dart';

final pageManager = ChangeNotifierProvider((ref) => PageManager(ref.read));

class PageManager extends ChangeNotifier {
  PageManager(
    this.read,
  );
  final Reader read;

  List<Page> get pages => List.unmodifiable(_pages);
  final _navigatorKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  void didPop(dynamic page, dynamic result) {
    _pages.remove(page);
    notifyListeners();
  }

  void goHome() {
    _pages.removeRange(1, _pages.length);
    notifyListeners();
  }

  final List<Page> _pages = [
    const MaterialPage(
      child: HomePage(),
      key: HomePage.pageKey,
    ),
  ];

  void pushPage1() {
    _pages.add(
      const MaterialPage(
        child: Page1(),
        key: Page1.pageKey,
      ),
    );
    notifyListeners();
  }

  void pushPage2() {
    _pages.add(
      const MaterialPage(
        child: Page2(),
        key: Page2.pageKey,
      ),
    );
    notifyListeners();
  }

  void pushPage3() {
    _pages.add(
      const MaterialPage(
        child: Page3(),
        key: Page3.pageKey,
      ),
    );
    notifyListeners();
  }
}

class MainNavigation extends ConsumerWidget {
  const MainNavigation({
    Key? key,
  }) : super(key: key);

  bool _onPopPage(
      Route<dynamic> route, dynamic result, PageManager pageManager) {
    pageManager.didPop(route.settings, result);
    return route.didPop(result);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WillPopScope(
      onWillPop: () async =>
          !await ref.watch(pageManager).navigatorKey.currentState!.maybePop(),
      child: Navigator(
        key: ref.watch(pageManager).navigatorKey,
        pages: List.unmodifiable(ref.watch(pageManager).pages),
        onPopPage: (route, result) =>
            _onPopPage(route, result, ref.watch(pageManager)),
      ),
    );
  }
}
