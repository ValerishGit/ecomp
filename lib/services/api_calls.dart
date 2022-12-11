import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:playground/modals/search_results_modal.dart';

const DEV_URL = "http://10.0.2.2:3001/compare?search=";

class ApiCalls {
  static Future<List<SiteResult>?> searchProducts(String searchTerm) async {
    var res = await http.get(Uri.parse("$DEV_URL$searchTerm"));
    if (res.statusCode == 200) {
      final List parsedList = await json.decode(res.body);
      List<SiteResult> results =
          parsedList.map((e) => SiteResult.fromMap(e)).toList();
      return results;
    }
    return null;
  }
}
