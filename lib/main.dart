import 'package:flutter/material.dart';
import 'package:page_view/list_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: getList().length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      print('tap - ${getList()[index].countryName}');
                    },
                    onDoubleTap: () {
                      print('double tap - ${getList()[index].countryName}');
                    },
                    child: Stack(
                      children: [
                        Image.network(
                          getList()[index].countryImageUrl,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              getList()[index].countryName,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          color: Colors.brown.withOpacity(0.3),
                          width: double.infinity,
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
