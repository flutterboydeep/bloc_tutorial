import 'package:http/http.dart' as http;

class ApiDataProvider {
  Future<String> getDataa() async {
    try {
      final response =
          await http.get(Uri.parse('https://fakestoreapi.com/products'));
      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw "Failed to Load product";
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
