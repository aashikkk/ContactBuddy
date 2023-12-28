import 'package:contacts_buddy/screens/add_new_contact.dart';
import 'package:contacts_buddy/screens/details_page.dart';
import 'package:contacts_buddy/screens/edit_page.dart';
import 'package:contacts_buddy/screens/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'homepage',
      routes: {
        'homepage': (context) => const HomePage(),
        'newcontact': (context) => const AddNew(),
        'detail': (context) => const DetailPage(),
        'editpage': (context) => const EditPage(),
      },
    ),
  );
}
