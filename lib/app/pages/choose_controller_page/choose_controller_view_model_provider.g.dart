// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'choose_controller_view_model_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$controllersHash() => r'46d31a85201f9c445743e328980414f6d06c6d68';

/// See also [controllers].
@ProviderFor(controllers)
final controllersProvider =
    AutoDisposeFutureProvider<List<Controller>>.internal(
  controllers,
  name: r'controllersProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$controllersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ControllersRef = AutoDisposeFutureProviderRef<List<Controller>>;
String _$selectedControllerHash() =>
    r'acf329f16757f81623ba738073218de131fdf158';

/// See also [SelectedController].
@ProviderFor(SelectedController)
final selectedControllerProvider =
    NotifierProvider<SelectedController, Controller?>.internal(
  SelectedController.new,
  name: r'selectedControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectedControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectedController = Notifier<Controller?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
