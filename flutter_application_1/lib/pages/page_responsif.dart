import 'package:flutter/material.dart';

class PageResponsif extends StatelessWidget {
  const PageResponsif({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      body: Container(
        color: Colors.blueGrey,
        child: Center(
          child: Text(
            'View \n\n' +
                '[Media Query width : ${screenSize.width.toStringAsFixed(2)}\n\n' +
                '[Media Query orientation ]: ${orientation}',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}

//Responsif dengan layout builder

class PageResponsifLayoutBuilder extends StatelessWidget {
  const PageResponsifLayoutBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          double width = constraints.maxWidth;
          double height = constraints.maxHeight;

          Orientation orientation = width > height
              ? Orientation.landscape
              : Orientation.portrait;

          return Container(
            color: Colors.blueGrey,
            child: Center(
              child: Text(
                'View\n\n'
                '[LayoutBuilder width : ${width.toStringAsFixed(2)}]\n\n'
                '[LayoutBuilder height : ${height.toStringAsFixed(2)}]\n\n'
                '[Orientation : $orientation]',
                style: const TextStyle(color: Colors.white, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
      ),
    );
  }
}
