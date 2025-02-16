class ExampleService {
  Future<String> getData() async {
    // Simulate a network call
    await Future.delayed(Duration(seconds: 2));
    return "Data from API";
  }
}
