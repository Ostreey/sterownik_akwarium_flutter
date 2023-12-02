import 'package:flutter/material.dart';
import 'package:sterownik_akwarium/app/core/page_config.dart';

class Devices extends StatelessWidget {
  const Devices({super.key});

  static final PageConfig pageConfig = PageConfig(
    icon: Icons.electrical_services,
    name: 'Urządzenia',
    child: Devices(),
  );

  @override
  Widget build(BuildContext context) {
    return Text("Devices");
  }
}
