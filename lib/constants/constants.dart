import 'package:flutter/material.dart';

class AppColors {
  static Color primaryColorLight = Colors.white;
  static Color secondaryColorLight = Colors.yellow;

  static Color primaryColorDark = Colors.black;
  static Color secondaryColorDark = Colors.purpleAccent;
}

class MyColors {
  static const primarypurple = Colors.purple;
  static const primarydeeppurple = Colors.deepPurple;
  static const primarywhite = Colors.white;
  static const primaryblack = Colors.black;
  static const primarygrey = Colors.grey;
  static const primarypurpleaccent = Colors.purpleAccent;
  static const primaryred = Colors.red;
  static const primaryorange = Colors.deepOrange;
  static const secorange = Colors.deepOrangeAccent;
  static const lightorange = Colors.orange;
  static const acorange = Colors.orangeAccent;
}

class MyRadius {
  static final primaryradius = BorderRadius.circular(15.0);
}

class MyPadding {
  static const primaryPadding = EdgeInsets.all(15.0);
  static const paddingsecond = EdgeInsets.all(20.0);
}

class MyStyle {
  static const avatarStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w600,
  );

  static const firstName = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );

  static const phoneNumber =
      TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

  static const emailAddress = TextStyle(
    fontSize: 16,
  );

  static const formStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );

  static const formlabel = TextStyle(
    fontSize: 20,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  static const buttonText = TextStyle(
    fontSize: 18,
  );

  static const screenName = TextStyle(
    color: MyColors.primaryblack,
  );

  static const sizedbox1 = SizedBox(
    height: 10.0,
  );
  static const sizedbox2 = SizedBox(
    height: 15.0,
  );
  static const sizedbox3 = SizedBox(
    width: 15.0,
  );
  static const sizedbox4 = SizedBox(
    height: 20.0,
  );
  static const sizedbox5 = SizedBox(
    height: 30.0,
  );
  static const sizedbox6 = SizedBox(
    height: 5.0,
  );

  static const spacer1 = Spacer(
    flex: 2,
  );

  static const addIcon = Icon(Icons.add);
  static const deleteIcon = Icon(Icons.delete);
  static const arrowBackIcon = Icon(Icons.arrow_back);
}

List texts = [
  "Where do you want to take photos from?",
  "Enter Your First Name...",
  "Enter Your Last Name...",
  "Enter Your Number...",
  "Enter Your Email..",
  "Add to Contact",
  "Update Details",
];

List setText = [
  "ALBUMS",
  "CAMERA",
];

List hintText = [
  "First Name",
  "Last Name",
  "+94 xxxxxxxxx",
  "Email",
  "Phone Number",
];

List buttonText = [
  "Add Contacts",
  "Go Back",
  "Are you sure?",
  "No",
  "Yes",
];

List title = [
  "Add Contact Details",
  "Contacts Details",
  "Edit Details",
  "Drawer Header",
  "Contact Buddy",
];

class CustomContainer extends StatelessWidget {
  String text;
  CustomContainer({Key? key, required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.black26,
      ),
      child: Center(
          child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      )),
    );
  }
}
