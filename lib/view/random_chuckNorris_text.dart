import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

var chuckText = 'Chuck Norris will not die';

const chuckNorrisUrl = 'https://api.chucknorris.io/jokes/random';

var isLoading = false;

Future getRandomChuckNorrisText() async {
  var dio = Dio();

  var response = await dio.get(chuckNorrisUrl);

  if (response.statusCode == 200) {
    chuckText = response.data['value'];
  } else {
    debugPrint('Error requesting API');
  }
}

void setLoading(bool value) {
  isLoading = value;
}
