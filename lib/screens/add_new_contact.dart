import 'dart:io';
import 'package:contacts_buddy/constants/constants.dart';
import 'package:contacts_buddy/model/model_class.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../constants/constants.dart';

class AddNew extends StatefulWidget {
  const AddNew({Key? key}) : super(key: key);

  @override
  State<AddNew> createState() => _AddNewState();
}

class _AddNewState extends State<AddNew> {
  final ImagePicker _picker = ImagePicker();

  GlobalKey<FormState> contactkey = GlobalKey<FormState>();

  TextEditingController firstnamecontroller = TextEditingController();
  TextEditingController lastnamecontroller = TextEditingController();
  TextEditingController phonenumbercontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();

  String? firstname;
  String? lastname;
  String? phonenumber;
  String? email;
  File? image;

  TextStyle mystyle = const TextStyle(
    fontSize: 20,
    color: Colors.black,
    fontWeight: FontWeight.w500,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title[0], style: MyStyle.screenName),
        backgroundColor: MyColors.primarywhite,
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    backgroundImage: (image != null) ? FileImage(image!) : null,
                    backgroundColor: MyColors.lightorange,
                    radius: 50,
                    child: Text(
                      (image != null) ? "" : "ADD",
                      style: const TextStyle(color: MyColors.primarywhite),
                    ),
                  ),
                  FloatingActionButton(
                    backgroundColor: MyColors.primaryorange,
                    onPressed: () async {
                      await showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(texts[0]),
                            actions: [
                              ElevatedButton(
                                onPressed: () async {
                                  XFile? pickedPhoto = await _picker.pickImage(
                                      source: ImageSource.gallery);
                                  setState(() {
                                    image = File(pickedPhoto!.path);
                                  });
                                  Navigator.of(context).pop();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: MyColors.primarydeeppurple,
                                ),
                                child: Text(setText[0]),
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  XFile? pickedFile = await _picker.pickImage(
                                      source: ImageSource.camera);
                                  setState(() {
                                    image = File(pickedFile!.path);
                                  });
                                  Navigator.of(context).pop();
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        MyColors.primarydeeppurple),
                                child: Text(setText[1]),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    mini: true,
                    child: MyStyle.addIcon,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Form(
                key: contactkey,
                child: Container(
                  padding: MyPadding.paddingsecond,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 25,
                        ),
                        TextFormField(
                          controller: firstnamecontroller,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return texts[1];
                            }
                            return null;
                          },
                          onSaved: (val) {
                            setState(() {
                              firstname = val;
                            });
                          },
                          decoration: InputDecoration(
                              border: const UnderlineInputBorder(),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: MyColors.primaryblack,
                                ),
                              ),
                              hintText: hintText[0]),
                        ),
                        MyStyle.sizedbox4,
                        TextFormField(
                          controller: lastnamecontroller,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return texts[2];
                            }
                            return null;
                          },
                          onSaved: (val) {
                            setState(() {
                              lastname = val;
                            });
                          },
                          decoration: InputDecoration(
                              border: const UnderlineInputBorder(),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: MyColors.primaryblack,
                                ),
                              ),
                              hintText: hintText[1]),
                        ),
                        MyStyle.sizedbox4,
                        TextFormField(
                          controller: phonenumbercontroller,
                          keyboardType: TextInputType.phone,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return texts[3];
                            }
                            return null;
                          },
                          onSaved: (val) {
                            setState(() {
                              phonenumber = val;
                            });
                          },
                          decoration: InputDecoration(
                              border: const UnderlineInputBorder(),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: MyColors.primaryblack),
                              ),
                              hintText: hintText[2]),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: emailcontroller,
                          keyboardType: TextInputType.emailAddress,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return texts[4];
                            }
                            return null;
                          },
                          onSaved: (val) {
                            setState(() {
                              email = val;
                            });
                          },
                          decoration: InputDecoration(
                            border: const UnderlineInputBorder(),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: MyColors.primaryblack),
                            ),
                            hintText: hintText[3],
                          ),
                        ),
                        MyStyle.sizedbox5,
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                if (contactkey.currentState!.validate()) {
                                  contactkey.currentState!.save();

                                  Contact c1 = Contact(
                                    firstname: firstname,
                                    lastname: lastname,
                                    phonenumber: phonenumber,
                                    email: email,
                                    image: image,
                                  );

                                  setState(() {
                                    Global.allcontacts.add(c1);
                                  });

                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      'homepage', (route) => false);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: MyColors.primaryorange,
                              ),
                              child: Text(buttonText[0],
                                  style: MyStyle.buttonText),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: MyColors.acorange,
                              ),
                              child: Text(buttonText[1],
                                  style: MyStyle.buttonText),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
