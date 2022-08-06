import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final counterProvider = StateProvider.autoDispose((ref) => 0);

class SecondPage extends ConsumerWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int counter = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Counter Page'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          ref.read(counterProvider.notifier).state++;
        },
      ),
      body: SafeArea(
        child: Center(
          child: Text(
            counter.toString(),
            style: TextStyle(fontSize: 50),
          ),
        ),
      ),
    );
  }
}
