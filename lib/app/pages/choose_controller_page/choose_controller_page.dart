import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/page_config.dart';
import 'choose_controller_view_model_provider.dart';

class ChooseControllerPage extends ConsumerWidget {
  const ChooseControllerPage({Key? key}) : super(key: key);

  static const pageConfig = PageConfig(
    icon: Icons.settings_outlined,
    name: "choose_controller_page",
    child: ChooseControllerPage(),
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controllerState = ref.watch(chooseControllerViewModelProvider);
    final controllerViewModel =
        ref.watch(chooseControllerViewModelProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Wybierz sterownik'),
      ),
      body: controllerState.when(
        data: (controllers) => ListView.builder(
          itemCount: controllers.length,
          itemBuilder: (context, index) {
            final controller = controllers[index];
            return ListTile(
              title: Text(controller.name),
              leading: Radio(
                value: controller.id,
                groupValue: controllerViewModel.selectedControllerId,
                onChanged: (value) {
                  controllerViewModel.selectController(value as String);
                },
              ),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('Error: $error')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddControllerDialog(context, controllerViewModel),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddControllerDialog(
      BuildContext context, ChooseControllerViewModel controllerViewModel) {
    final nameController = TextEditingController();
    final idController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add New Controller'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Controller Name'),
              ),
              TextField(
                controller: idController,
                decoration: const InputDecoration(labelText: 'Controller ID'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                final name = nameController.text;
                final id = idController.text;
                if (name.isNotEmpty && id.isNotEmpty) {
                  controllerViewModel.addNewController(name, id);
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
