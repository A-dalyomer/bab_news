import 'package:bab_news/features/network/domain/repositories/api_repository.dart';
import 'package:bab_news/features/network/presentation/di/register_network_bindings.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

void main() async {
  group('test network dependency injector', () {
    test('test that [ApiRequestsRepositoryImp] singleton is registered',
        () async {
      ///Arrange
      final GetIt getIt = GetIt.instance;

      ///Act
      registererNetworkBindings(getIt);

      ///assert
      expect(
        getIt<ApiRequestsRepository>(),
        isA<ApiRequestsRepository>(),
      );
    });
  });
}
