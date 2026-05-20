import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_application_1/pages/page_flex_list.dart';
import 'package:flutter/services.dart';

class PageMaterialDesign extends StatelessWidget {
  const PageMaterialDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material Design',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // brightness: Brightness.dark,

        //thypograpgy
        textTheme: GoogleFonts.poppinsTextTheme(),
        //app bar theme
        appBarTheme: AppBarTheme(centerTitle: true, scrolledUnderElevation: 0),
      ),

      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // brightness: Brightness.dark,
      ),

      themeMode: ThemeMode.system, //ngikut dari sistem nya
      home: PageContentMaterial(),
    );
  }
}

class PageContentMaterial extends StatefulWidget {
  const PageContentMaterial({super.key});

  @override
  State<PageContentMaterial> createState() => _PageContentMaterialState();
}

class _PageContentMaterialState extends State<PageContentMaterial> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = [
    PageSimpleForm(),
    PageCupertinoIOS(),
    PageButtonMaterial(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _pages),

      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        indicatorColor: Theme.of(context).colorScheme.secondaryContainer,
        destinations: [
          NavigationDestination(icon: Icon(Icons.list), label: 'List'),
          NavigationDestination(icon: Icon(Icons.grid_view), label: 'Grid'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class PageButtonMaterial extends StatelessWidget {
  const PageButtonMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Typography
            Text(
              'Typography',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 10),
            Text(
              'Typography',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 10),
            Text(
              'Typography',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(height: 10),
            Text(
              'Typography',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 10),
            Text(
              'Typography',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 10),

            Card(
              elevation: 0,
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Theme.of(context).colorScheme.outline),
              ),
              clipBehavior: Clip.antiAlias,
              child: ElevatedButton(
                onPressed: () {
                  //ketike d klik button maka akan muncul dialog
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Dialog Title'),
                      content: Text('Dialog Content'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Close'),
                        ),
                      ],
                    ),
                  );
                },
                child: Text('Elevated Button'),
              ),
            ),
            SizedBox(height: 10),
            OutlinedButton(
              onPressed: () {
                //Modal bottom sheet
                showModalBottomSheet(
                  context: context,
                  useSafeArea: true,
                  isScrollControlled: true,
                  builder: (context) => Container(
                    padding: EdgeInsets.all(16),
                    height: 200,
                    color: Colors.grey,
                    child: Center(child: Text('Modal Bottom Sheet')),
                  ),
                );
              },
              child: Text('Outlined Button'),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                //snackbar
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Item berhasil disimpan'),
                    duration: Duration(seconds: 5), //5 detik
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: EdgeInsets.all(16),
                    padding: EdgeInsets.all(16),
                    action: SnackBarAction(label: 'Undo', onPressed: () {}),
                  ),
                );
              },
              child: Text('Text Button'),
            ),
            SizedBox(height: 10),
            IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
            SizedBox(height: 10),
            FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.fourteen_mp),
            ),
            SizedBox(height: 10),
            FilledButton(onPressed: () {}, child: Text('Filled Button')),
            SizedBox(height: 10),
            OutlinedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.camera),
              label: Text('Outlined Button Icon'),
            ),
            SizedBox(height: 10),
            TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.browse_gallery),
              label: Text('Text Button Icon'),
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.escalator),
              label: Text('Elevated Button Icon'),
            ),
            SizedBox(height: 10),
            FilledButton.icon(
              onPressed: () {},
              icon: Icon(Icons.gamepad),
              label: Text('Filled Button Icon'),
            ),
          ],
        ),
      ),
    );
  }
}

class PageCupertinoIOS extends StatelessWidget {
  const PageCupertinoIOS({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'My IOS APp',
      theme: CupertinoThemeData(
        primaryColor: CupertinoColors.activeBlue,
        scaffoldBackgroundColor: CupertinoColors.white,
        textTheme: CupertinoTextThemeData(primaryColor: CupertinoColors.black),
      ),
      home: HomeIOSScreen(),
    );
  }
}

class HomeIOSScreen extends StatelessWidget {
  const HomeIOSScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Cupertino App'),
            SizedBox(height: 10),
            CupertinoButton(
              onPressed: () async {
                await Future.delayed(const Duration(seconds: 1));
                if (!context.mounted) return;
                showCupertinoDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CupertinoAlertDialog(
                      title: Text('Cupertino Dialog'),
                      content: Text('Cupertino Dialog Content'),
                      actions: [
                        CupertinoDialogAction(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Close'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Cupertino Button'),
            ),
          ],
        ),
      ),
    );
  }
}

class PageSimpleForm extends StatefulWidget {
  const PageSimpleForm({super.key});

  @override
  State<PageSimpleForm> createState() => _PageSimpleFormState();
}

class _PageSimpleFormState extends State<PageSimpleForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Form'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 10),
            Text('Simple Form'),
            SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Username',
                  hintText: 'Masukkan Username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                keyboardType: TextInputType.name, //hanya huruf aja
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsetsGeometry.all(10),
              child: TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly, //hanya angka aja
                  LengthLimitingTextInputFormatter(10),
                ],
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  hintText: 'Masukkan Nomor Telepon',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
