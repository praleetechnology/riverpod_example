import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/provider/home_page_title_provider.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final title = ref.watch(titleProvider);
      return Text(title);
    });
  }
}
