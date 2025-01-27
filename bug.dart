```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Success, process the JSON response
      final jsonData = jsonDecode(response.body);
      // Access data from jsonData
      print(jsonData['key']);
    } else {
      // Handle error (non-200 status codes)
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    // Handle exceptions during network request or JSON decoding
    print('Error: $e');
    // Consider rethrowing the exception or handling it appropriately
    rethrow; //rethrow; 
  }
}
```