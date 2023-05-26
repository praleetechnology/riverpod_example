import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/provider/counter_provider.dart';
import 'package:riverpod_example/provider/home_page_title_provider.dart';

import 'header_widget.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});
  void _increment(WidgetRef ref) {
    ref.read(counterProvider.notifier).update((state) => ++state);
  }

  void _changeTitle(WidgetRef ref) {
    ref
        .read(titleProvider.notifier)
        .update((state) => "Riverpod Title Changed");
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const HeaderWidget(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
                onPressed: () {
                  _changeTitle(ref);
                },
                child: const Text("Change Title"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _increment(ref);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
