// ignore_for_file: file_names, avoid_print

import 'dart:convert';
import 'package:http/http.dart';
import 'package:tmbd/Constants/Api.dart';

class WebServices {
  late final Client client;

  Future<List<dynamic>> getAllMovies() async {
    final response = await client.get(Uri.parse
      ('${Api.baseUrl}trending/movie/day?api_key=${Api.apikey}' ,
      ),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
