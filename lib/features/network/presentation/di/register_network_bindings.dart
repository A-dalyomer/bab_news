import 'package:bab_news/features/network/data/datasources/network_data_source.dart';
import 'package:bab_news/features/network/data/repositories/api_repository.dart';
import 'package:bab_news/features/network/domain/repositories/api_repository.dart';
import 'package:get_it/get_it.dart';

Future<void> registererNetworkBindings(GetIt getIt) async {
  getIt.registerSingleton<NetworkDataSource>(NetworkDataSource());
  getIt.registerSingleton<ApiRequestsRepository>(
    ApiRequestsRepositoryImp(getIt()),
  );
}
