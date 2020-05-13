import 'package:flutter/material.dart';
///@author Willian Marchesan
///
class CustomGridView extends StatelessWidget {
  final height;
  final data;
  final horizontal;
  final builder;
  final width;

  ///Contrutor da classe
  const CustomGridView({
    @required this.data,
    @required this.height,
    @required this.horizontal,
    @required this.builder,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: _createGridView(
              data: data,
              horizontal: horizontal,
              builder: builder,
              height: height,
              width: width ?? (constraints.maxWidth - 20) / horizontal,
            ),
          ),
        ),
      );
    });
  }
}

List<Widget> _createGridView({data, horizontal, builder, height, width}) {
  if (data != null && data.length > 0) {
    List<Widget> coluna = [];
    List<Widget> linha = [];

    for (var i = 0; i < data.length; i++) {
      final item = Container(
        height: height,
        width: width,
        child: builder(data[i]),
      );

      linha.add(item);

      if ((i + 1) % horizontal == 0) {
        final linhaData = Row(
          children: linha,
        );
        coluna.add(linhaData);

        linha = [];
      }
    }

    if (linha.isNotEmpty) {
      final linhaData = Row(
        children: linha,
      );
      coluna.add(linhaData);
    }

    return coluna;
  }

  return [Container()];
}
