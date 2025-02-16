import 'package:iiit_raichur_app/services/example_service.dart';

class ExampleRepository {
  final ExampleService service;

  ExampleRepository({required this.service});

  Future<String> fetchData() async {
    return await service.getData();
  }
}
