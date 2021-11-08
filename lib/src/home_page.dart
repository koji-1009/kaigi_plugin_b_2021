import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kaigi_plugin_c_2021/kaigi_plugin_c_2021.dart';
import 'package:kaigi_plugin_d_2021/kaigi_plugin_d_2021.dart';

class MyHomePage extends HookConsumerWidget {
  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = useState(0);

    final Widget body;
    switch (currentIndex.value) {
      case 0:
        body = const ScreenName();
        break;
      case 1:
        body = const ScreenCounter();
        break;
      default:
        body = const Center(
          child: CircularProgressIndicator(),
        );
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: body,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'Name',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add,
            ),
            label: 'Counter',
          ),
        ],
        currentIndex: currentIndex.value,
        onTap: (index) {
          currentIndex.value = index;
        },
      ),
    );
  }
}
