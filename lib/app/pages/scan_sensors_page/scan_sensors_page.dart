import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sterownik_akwarium/app/core/page_config.dart';
import 'package:sterownik_akwarium/app/pages/parameters_page/mqtt_provider.dart';

class ScanSensorsPage extends ConsumerStatefulWidget {
  const ScanSensorsPage({super.key});

  static const pageConfig = PageConfig(
    icon: Icons.sensors,
    name: 'scan_sensors',
    child: ScanSensorsPage(),
  );

  @override
  ConsumerState<ScanSensorsPage> createState() => _ScanSensorsPageState();
}

class _ScanSensorsPageState extends ConsumerState<ScanSensorsPage> {
  static const String _deviceNumber = "001";

  static const List<String> _roles = ['aqua', 'tank', 'fan1', 'fan2'];
  static const Map<String, String> _roleLabels = {
    'aqua': 'Woda akwarium',
    'tank': 'Zbiornik',
    'fan1': 'Wentylator 1',
    'fan2': 'Wentylator 2',
  };

  final Map<String, String?> _assignments = {};
  bool _isSending = false;

  void _triggerScan() {
    final transport = ref.read(activeTransportProvider);
    transport.sendCommand(
        "$_deviceNumber/scan_sensors", json.encode({"cmd": "scan"}));
  }

  Future<void> _saveAssignment(String rom, String role) async {
    setState(() => _isSending = true);
    final transport = ref.read(activeTransportProvider);
    await transport.sendCommand(
        "$_deviceNumber/assign_sensor", json.encode({"role": role, "rom": rom}));
    if (mounted) {
      setState(() => _isSending = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Przypisano → ${_roleLabels[role]}")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final scanResult = ref.watch(sensorScanProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Czujniki DS18B20")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _triggerScan,
                icon: const Icon(Icons.search),
                label: const Text("Skanuj magistralę OneWire"),
              ),
            ),
          ),
          Expanded(
            child: scanResult.when(
              data: (discovery) {
                if (discovery.sensors.isEmpty) {
                  return const Center(
                    child: Text("Naciśnij Skanuj, aby znaleźć czujniki"),
                  );
                }
                return ListView.builder(
                  itemCount: discovery.sensors.length,
                  itemBuilder: (ctx, i) {
                    final rom = discovery.sensors[i];
                    return Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 4),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              rom,
                              style: const TextStyle(
                                fontFamily: 'monospace',
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const Text("Rola:"),
                                const SizedBox(width: 12),
                                DropdownButton<String>(
                                  value: _assignments[rom],
                                  hint: const Text("Wybierz rolę"),
                                  items: _roles
                                      .map((r) => DropdownMenuItem(
                                            value: r,
                                            child: Text(_roleLabels[r]!),
                                          ))
                                      .toList(),
                                  onChanged: (val) {
                                    if (val != null) {
                                      setState(
                                          () => _assignments[rom] = val);
                                    }
                                  },
                                ),
                                const Spacer(),
                                ElevatedButton(
                                  onPressed:
                                      (_assignments[rom] != null && !_isSending)
                                          ? () => _saveAssignment(
                                              rom, _assignments[rom]!)
                                          : null,
                                  child: const Text("Zapisz"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              loading: () =>
                  const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text("Błąd: $e")),
            ),
          ),
        ],
      ),
    );
  }
}
