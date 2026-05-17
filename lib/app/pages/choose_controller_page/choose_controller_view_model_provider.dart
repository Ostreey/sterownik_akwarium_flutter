import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/repositories/firebase_repository/models/controller_model.dart';
import '../../core/providers.dart';

part 'choose_controller_view_model_provider.g.dart';

@riverpod
Future<List<Controller>> controllers(Ref ref) async {
  final fetchUseCase = ref.read(fetchControllersUseCaseProvider);
  final result = await fetchUseCase.execute();
  return result.fold((controllers) => controllers, (error) => throw error);
}
