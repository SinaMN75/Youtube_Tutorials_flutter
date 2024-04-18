import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  List<AppContact> list = <AppContact>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          addContactDialog();
        },
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          final AppContact i = list[index];
          return ListTile(title: Text(i.name), subtitle: Text(i.phoneNumber));
        },
        separatorBuilder: (BuildContext context, int index) => Divider(height: 0),
        itemCount: list.length,
      ),
    );
  }

  void addContactDialog() {
    TextEditingController controllerName = TextEditingController();
    TextEditingController controllerPhoneNumber = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: controllerName, decoration: InputDecoration(hintText: "Name")),
            SizedBox(height: 8),
            TextField(
              controller: controllerPhoneNumber,
              decoration: InputDecoration(hintText: "Phone Number"),
            ),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  list.add(
                    AppContact(name: controllerName.text, phoneNumber: controllerPhoneNumber.text),
                  );
                });
                Navigator.pop(context);
              },
              child: Text("Add"),
            ),
          ],
        ),
      ),
    );
  }
}

class AppContact {
  final String name;
  final String phoneNumber;

  AppContact({required this.name, required this.phoneNumber});
}
