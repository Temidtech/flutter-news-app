import 'dart:convert';

import 'package:http/http.dart' as http;

var client = http.Client();


// getNews() async {
//   try {
//     var response = await client.get(
//         Uri.https('example.com',
//             'whatsit/create'),);
//     var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
//     var uri = Uri.parse(decodedResponse['uri'] as String);
//     print(await client.get(uri));
//   } finally {
//     client.close();
//   }
// }

Future<Map<String, dynamic>> getNews() async {
  var url = Uri.parse('https://newsapi.org/v2/everything?q=tesla&from=${DateTime.now().toString().split(" ")[0]}&sortBy=publishedAt&apiKey=145a7bc559624f0dbda37e949fe03422');
  var response = await http.get(url);
  if (response.statusCode == 200) {
    Map<String, dynamic> jsonResponse = json.decode(response.body);
    print('about http: ${response.body}.');
    return jsonResponse;
  } else {
    print('Request failed with status: ${response.body}.');
    return {"message": "${response.statusCode}"};
  }
}