import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sterownik_akwarium/app/pages/parameters_page/parameters.dart';
import 'package:sterownik_akwarium/app/pages/widgets/custom_button.dart';
import 'package:go_router/go_router.dart';

import '../../core/page_config.dart';
import '../../pages/home_page/home_page.dart';
import 'add_controller_provider.dart';
import 'choose_controller_view_model_provider.dart';

class ChooseControllerPage extends ConsumerWidget {
  const ChooseControllerPage({super.key});

  static const pageConfig = PageConfig(
    icon: Icons.settings_outlined,
    name: "choose_controller_page",
    child: ChooseControllerPage(),
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controllersAsync = ref.watch(controllersProvider);
    final selectedController = ref.watch(selectedControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Wybierz sterownik'),
        actions: [
          TextButton(
            onPressed: selectedController != null 
              ? () async {
                  await ref.read(selectedControllerProvider.notifier).saveToPreferences();
                  if (context.mounted) {
                    context.goNamed(
                      HomePage.pageConfig.name,
                      pathParameters: {
                        'tab': Parameters.pageConfig.name,
                      },
                    );
                  }
                }
              : null,
            child: const Text('Dalej'),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: controllersAsync.when(
              data: (controllers) => ListView.builder(
                itemCount: controllers.length,
                itemBuilder: (context, index) {
                  final controller = controllers[index];
                  final isSelected = selectedController?.id == controller.id;

                  return ListTile(
                    title: Text(controller.name),
                    trailing: isSelected ? const Icon(Icons.check) : null,
                    onTap: () => ref
                        .read(selectedControllerProvider.notifier)
                        .select(controller),
                  );
                },
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(
                child: Text('Error: $error'),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddControllerDialog(context, ref),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddControllerDialog(BuildContext context, WidgetRef ref) {
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
            Consumer(
              builder: (context, ref, child) {
                final addControllerNotifier =
                    ref.read(addControllerNotifierProvider.notifier);
                final addControllerListener =
                    ref.watch(addControllerNotifierProvider);
                return CustomButton(
                  isLoading: addControllerListener.isLoading,
                  text: 'Dodaj',
                  onPressed: () async {
                    final name = nameController.text;
                    final id = idController.text;
                    if (name.isNotEmpty && id.isNotEmpty) {
                      await addControllerNotifier.addController(name, id);
                      Navigator.of(context).pop();
                    }
                  },
                );
              },
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Anuluj'),
            ),
          ],
        );
      },
    );
  }
}
