import 'package:flutter/material.dart';

class PageFlexList extends StatelessWidget {
  const PageFlexList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Flexible List'),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(32),
          decoration: BoxDecoration(border: Border.all(color: Colors.red)),
          child: ListView(
            shrinkWrap:
                true, //untuk buat lebih fleksible dan menyesuaikan widget
            children: [
              ListTile(title: Text('Item 1')),
              ListTile(title: Text('Item 2')),
              ListTile(title: Text('Item 3')),
              ListTile(title: Text('Item 4')),
              ListTile(title: Text('Item 5')),
              ListTile(title: Text('Item 6')),
              ListTile(title: Text('Item 7')),
              ListTile(title: Text('Item 8')),
              ListTile(title: Text('Item 9')),
              ListTile(title: Text('Item 10')),
              Row(
                children: [
                  Flexible(
                    flex: 4,
                    fit: FlexFit.loose,
                    child: Text(
                      'Teks Panjang yang bisa wrap',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Press This Button'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PageListVertical extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('ListView Vertical'),
      ),
      //listview builder
      //listview separated
      //body: ListView(
      //padding: EdgeInsets.all(16),
      //children: [
      //ListTile(title: Text('Item 1'),),
      //ListTile(title: Text('Item 2'),),

      // ],
      //),
      //gridview
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.75,
        padding: EdgeInsets.all(16),
        children: [
          Container(height: 200, width: 200, color: Colors.green),
          Container(height: 200, width: 200, color: Colors.red),
          Container(height: 200, width: 200, color: Colors.blue),
          Container(height: 200, width: 200, color: Colors.orange),
        ],
      ),
    );
  }
}

class PageSilverWidget extends StatelessWidget {
  const PageSilverWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            floating: false,
            flexibleSpace: const FlexibleSpaceBar(
              title: Text('Page Silver Widget'),
              background: Image(
                image: NetworkImage(
                  'https://images.pexels.com/photos/1939485/pexels-photo-1939485.jpeg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Konten Statis
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Card(
                    color: Colors.orange,
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Text("Widget 1"),
                    ),
                  ),
                  Container(height: 200, width: 200, color: Colors.green),
                  Container(height: 200, width: 200, color: Colors.red),
                  Container(height: 200, width: 200, color: Colors.blue),
                  Container(height: 200, width: 200, color: Colors.orange),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
