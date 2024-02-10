import 'package:http/http.dart' as http;

class ApiDataProvider {
  Future<String> getDataa() async {
    try {
      var response =
          await http.get(Uri.parse('https://fakestoreapi.com/products'));
      if (response.statusCode == 200) {
        // final d = jsonDecode(response.body);
        // log(d.toString());

        return response.body;
      } else {
        throw "Failed to Load product";
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
