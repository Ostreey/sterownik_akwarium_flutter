import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/page_config.dart';
import 'choose_controller_view_model_provider.dart';

final selectedControllerProvider = StateProvider<String?>((ref) => null);

class ChooseControllerPage extends ConsumerWidget {
  const ChooseControllerPage({Key? key}) : super(key: key);

  static const pageConfig = PageConfig(
    icon: Icons.settings_outlined,
    name: "choose_controller_page",
    child: ChooseControllerPage(),
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controllersAsync = ref.watch(controllersProvider);
    final selectedController = ref.watch(selectedControllerProvider);
    final controllersNotifier = ref.read(controllersProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Wybierz sterownik'),
      ),
      body: controllersAsync.when(
        data: (controllers) => ListView.builder(
          itemCount: controllers.length,
          itemBuilder: (context, index) {
            final controller = controllers[index];
            return ListTile(
              title: Text(controller.name),
              leading: Radio<String>(
                value: controller.name,
                groupValue: selectedController,
                onChanged: (value) {
                  ref.read(selectedControllerProvider.notifier).state = value;
                },
              ),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('Error: $error')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddControllerDialog(context, controllersNotifier),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddControllerDialog(
      BuildContext context, Controllers controllersNotifier) {
    final nameController = TextEditingController();
    final idController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Dodaj nowy sterownik'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                    labelText: 'Nazwa sterownika',
                    hintText: 'np. Akwarium w salonie'),
              ),
              TextField(
                controller: idController,
                decoration: const InputDecoration(
                    labelText: 'Numer seryjny sterownika',
                    hintText: 'np. AQ001'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () async {
                final name = nameController.text;
                final id = idController.text;
                if (name.isNotEmpty && id.isNotEmpty) {
                  await controllersNotifier.addNewController(name, id);
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
