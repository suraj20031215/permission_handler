import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.deepPurpleAccent,
              child: Text('Click'),
              onPressed: () {
                permission(Permission.location, context);
                setState(() {
                });
              },
            )
          ],
        ),
      ),
    );
  }

  Future<void> permission(Permission permission, BuildContext context) async {
    final status = await permission.request();
    if (status.isGranted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Permission is granted"),
      ));
    }

    else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Permission is not granted"),
      ));
    }

  }
}
