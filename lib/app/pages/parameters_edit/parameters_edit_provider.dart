import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final onSaveCallbackProvider = Provider<VoidCallback?>((ref) {
  // Define a default callback logic or return null if no default behavior is desired
  return null;
});
