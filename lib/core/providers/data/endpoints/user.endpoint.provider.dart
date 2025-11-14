import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tictactoe/core/providers/data/clients/dio_client.provider.dart';
import 'package:tictactoe/data/clients/dio.client.dart';
import 'package:tictactoe/data/endpoint/user.endpoint.dart';

part 'user.endpoint.provider.g.dart';

/// User endpoint provider
@riverpod
Future<UserEndpoint> userEndpoint(Ref ref) async {
  final DioClient dio = await ref.watch(dioClientProvider.future);

  return UserEndpoint(dio);
}
