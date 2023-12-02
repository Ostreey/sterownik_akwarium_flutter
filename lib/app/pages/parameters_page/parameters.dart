import 'package:flutter/material.dart';

import '../../core/page_config.dart';

class Parameters extends StatelessWidget {
  const Parameters({super.key});

  static final PageConfig pageConfig = PageConfig(
    icon: Icons.bar_chart,
    name: 'Parametry',
    child: Parameters(),
  );
  @override
  Widget build(BuildContext context) {
    return Text("PARAMETERS");
  }
}
