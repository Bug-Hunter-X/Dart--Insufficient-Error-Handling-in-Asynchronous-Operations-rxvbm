```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<dynamic> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      try {
        final jsonData = jsonDecode(response.body);
        return jsonData['key']; // Return data instead of printing
      } on FormatException {
        throw Exception('Invalid JSON format');
      }
    } else {
      throw Exception('Failed to load data: ${response.statusCode} - ${response.reasonPhrase}');
    }
  } on http.ClientException catch (e) {
    throw Exception('Network error: $e');
  } catch (e) {
    rethrow; // Re-throw other unexpected errors
  }
}

void main() async {
  try {
    final data = await fetchData();
    print('Data: $data');
  } catch (e) {
    print('An error occurred: $e');
  }
}
```