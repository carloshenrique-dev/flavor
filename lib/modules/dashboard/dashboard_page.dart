import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavor/core/consts.dart';
import 'package:flavor/modules/favorite/favorite_page.dart';
import 'package:flavor/modules/dashboard/widgets/bottom_navigation_bar_widget.dart';
import 'package:flavor/modules/search/search_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final PageController _controller = PageController(initialPage: 0);
  int _index = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<bool> signOut() async {
    try {
      return await FirebaseAuth.instance.signOut().then((value) => true);
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            icon: const Icon(Icons.menu),
          ),
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.white,
          child: ListView(
            children: [
              TextButton(
                onPressed: () async {
                  final result = await signOut();
                  if (result && context.mounted) {
                    context.pushReplacementNamed(AppRoutes.login.name);
                  }
                },
                child: const Text(
                  'Sair',
                ),
              )
            ],
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: PageView(
          controller: _controller,
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (value) => setState(() {
            _index = value;
          }),
          children: const [
            //HomePage(),
            SearchPage(),
            //NewRecipePage(),
            FavoritePage(),
          ],
        ),
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBarWidget(
          index: _index,
          onChanged: (value) {
            _controller.jumpToPage(
              value,
            );
          },
        ),
      ),
    );
  }
}
