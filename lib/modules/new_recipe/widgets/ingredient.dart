import 'package:flutter/material.dart';

class Ingrediente extends StatelessWidget {
  const Ingrediente({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      title: Row(
        children: [
          Expanded(
            flex: 4,
            child: SizedBox(
              height: 50,
              child: Center(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Digite aqui o nome do ingrediente",
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Flexible(
            child: SizedBox(
              height: 50,
              child: Center(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "QTD",
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
