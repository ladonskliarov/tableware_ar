import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tableware_ar/data/local_data.dart';
import 'package:tableware_ar/presentation/ar_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Магазин посуду',
      theme: ThemeData.dark(),
      home: const MyHomePage(title: 'Магазин посуду'),
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
        backgroundColor: Colors.black12,
        elevation: 10.0,
        centerTitle: false,
        title: Text(widget.title),
        titleTextStyle: const TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: const Center(
          child: TablewareSlider(),
      ),
    );
  }
}

class TablewareSlider extends StatefulWidget {
  const TablewareSlider({Key? key}) : super(key: key);

  @override
  State<TablewareSlider> createState() => _TablewareSliderState();
}

class _TablewareSliderState extends State<TablewareSlider> {

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
        shrinkWrap: true,
          itemCount: products.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index){
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ArPage(
                      model: products[index].model,
                    )
                  )
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.grey.withOpacity(0.3),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: const Offset(1, -1),
                      blurRadius: 10.0,
                      spreadRadius: 1.0,
                    )
                  ]
                ),
                margin: const EdgeInsets.only(top: 15.0, left: 10, right: 10),
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                height: MediaQuery.of(context).size.height / 3,
                width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                products[index].name,
                                style: const TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '${products[index].price} грн',
                                style: const TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: SizedBox(
                                  height: 25.0,
                                  width: 25.0,
                                  child: Image.asset(
                                    'assets/images/ar.png',
                                    fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child:
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.asset(
                                products[index].image,
                                fit: BoxFit.fill,
                              ),
                            )
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                products[index].description,
                                softWrap: true,
                                maxLines: 8,
                                style: const TextStyle(
                                    overflow: TextOverflow.fade),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
            );
          }
    );
  }
}