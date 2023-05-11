import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  var chuckText = 'Chuck Norris will not die';

  final chuckNorrisUrl = 'https://api.chucknorris.io/jokes/random';

  var isLoading = false;

  Future getRandomChuckNorrisText() async {
    var dio = Dio();

    var response = await dio.get(chuckNorrisUrl);

    if (response.statusCode == 200) {
      setState(() {
        chuckText = response.data['value'];
      });
    } else {
      debugPrint('Error requesting API');
    }
  }

  void setLoading(bool value) {
    setState(() {
      isLoading = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(100, 255, 230, 230),
        child: Stack(
          children: [
            GestureDetector(
              onTap: (() async {
                setLoading(true);
                await getRandomChuckNorrisText();
                setLoading(false);
              }),
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: NetworkImage(
                        'https://images02.military.com/sites/default/files/2021-04/chucknorris.jpeg'),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Expanded(child: Container()),
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 0.0, left: 30, right: 30),
                      child: isLoading
                          ? const CircularProgressIndicator()
                          : Text(
                              chuckText,
                              style: const TextStyle(
                                  color: Colors.indigo,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                              maxLines: 10,
                            ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
