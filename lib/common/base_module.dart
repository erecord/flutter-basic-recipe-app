import 'package:get_it/get_it.dart';

abstract class BaseModule {
  GetIt getIt = GetIt.instance;
  void registerModule();
}
