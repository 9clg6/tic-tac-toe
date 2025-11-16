// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firestore.service.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$firestoreClientHash() => r'c60156d5057a757f82f839996ae17764249c5ee7';

/// Provides the shared [FirestoreClient] instance.
///
/// Copied from [firestoreClient].
@ProviderFor(firestoreClient)
final firestoreClientProvider = Provider<FirestoreClient>.internal(
  firestoreClient,
  name: r'firestoreClientProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$firestoreClientHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FirestoreClientRef = ProviderRef<FirestoreClient>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
