import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/counterapp_provider/counter_provider.dart';
import 'package:flutter_application_1/counterapp_provider/counter_screen.dart';
import 'package:flutter_application_1/pages/page_flex_list.dart';
import 'package:flutter_application_1/pages/page_go_navigator.dart';
import 'package:flutter_application_1/pages/page_material_design.dart';
import 'package:flutter_application_1/pages/page_responsif.dart';
import 'package:flutter_application_1/pages/page_login.dart';
import 'package:flutter_application_1/providers/todo_model.dart';
import 'package:flutter_application_1/views/TodoPageScreen.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';



/*void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CounterProvider(),
      child: MyApp(),
    ),
  );
}*/
void main() => runApp(const MyApp());
/// The route configuration.
final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const PageGoNavigator();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'details',
          builder: (BuildContext context, GoRouterState state) {
            return const DetailsScreen();
          },
        ),
      ],
    ),
  ],
);
/*void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TodoModel(),
      child: MyApp(),
    ),
  );
}*/

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: _router);
      
  }
}

class PageMain extends StatelessWidget {
  const PageMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Training PNP Apps"),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10), //vertical
          //SizedBox(width: 10,), //horizontal
          Container(
            height: 100,
            padding: EdgeInsets.all(12), //kasih jarak atas bawah, kiri kanan
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Center(child: Text('Hello, Selamat datang')),
          ),

          SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            alignment: WrapAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PageFlexList()),
                  );
                },
                child: Chip(
                  label: Text('Flexible List'),
                  backgroundColor: Colors.orange.withOpacity(0.5),
                ),
              ),

              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PageListVertical()),
                  );
                },
                child: Chip(
                  label: Text('Vertical List'),
                  backgroundColor: Colors.orange.withOpacity(0.5),
                ),
              ),

              Chip(
                label: Text('Kategori 3'),
                backgroundColor: Colors.green.withOpacity(0.5),
              ),

              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PageResponsif()),
                  );
                },
                child: Chip(
                  label: Text('Responsif Page'),
                  backgroundColor: Colors.orange.withOpacity(0.5),
                ),
              ),

              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PageResponsifLayoutBuilder(),
                    ),
                  );
                },
                child: Chip(
                  label: Text('Layout Builder'),
                  backgroundColor: Colors.orange.withOpacity(0.5),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PageMaterialDesign(),
                    ),
                  );
                },
                child: Chip(
                  label: Text('Material Design'),
                  backgroundColor: Colors.orange.withOpacity(0.5),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Stack(
            fit: StackFit.loose,
            alignment: AlignmentGeometry.center,
            children: [
              Image.network(
                'https://images.pexels.com/photos/1939485/pexels-photo-1939485.jpeg',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              //overlay gelap di atas gambar
              Container(color: Colors.black.withOpacity(0.4)),
              const Positioned(
                bottom: 16,
                left: 16,
                right: 16,
                child: Text(
                  'Caption dibawah gambar',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),

              //badge atau icon di pojok kanan atas
              const Positioned(
                top: 8,
                right: 8,
                child: Badge(label: Text('Baru')),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
