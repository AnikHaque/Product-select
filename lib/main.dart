import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: SelectableListScreen(),
  ));
}

class SelectableListScreen extends StatefulWidget {
  @override
  _SelectableListScreenState createState() => _SelectableListScreenState();
}

class _SelectableListScreenState extends State<SelectableListScreen> {
  List<Item> items = List.generate(5, (index) => Item(index, 'Item ${index + 1}'));
  Set<int> selectedItems = Set();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selectable List'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            title: Text(item.name),
            tileColor: selectedItems.contains(item.id) ? Colors.blue : null,
            onTap: () {
              setState(() {
                if (selectedItems.contains(item.id)) {
                  selectedItems.remove(item.id);
                } else {
                  selectedItems.add(item.id);
                }
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showSelectedItemsCountDialog();
        },
        child: Icon(Icons.check),
      ),
    );
  }

  void _showSelectedItemsCountDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Selected Items Count'),
          content: Text('You have selected ${selectedItems.length} items.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

class Item {
  final int id;
  final String name;

  Item(this.id, this.name);
}
