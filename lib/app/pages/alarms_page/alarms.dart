import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/page_config.dart';

class Alarms extends ConsumerWidget {
  const Alarms({super.key});

  static final PageConfig pageConfig = PageConfig(
    icon: Icons.alarm,
    name: 'Alarmy',
    child: Alarms(),
  );
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text("ALARMS");
  }
}
