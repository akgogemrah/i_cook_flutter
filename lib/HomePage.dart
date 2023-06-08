import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Services/AuthService.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "HomePage",
            ),
            ElevatedButton(onPressed: ()async{
              await Provider.of<Auth>(context,listen: false).signOut();



            }, child:Text("LogOut"))
          ],
        ),
      ),

    );
  }
}
