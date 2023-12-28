import 'dart:io';

import 'package:contacts_buddy/constants/constants.dart';
import 'package:flutter/material.dart';
import '../model/model_class.dart';
// ignore: depend_on_referenced_packages
import 'package:colorful_safe_area/colorful_safe_area.dart';

class EditPage extends StatefulWidget {
  const EditPage({Key? key}) : super(key: key);

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final GlobalKey<FormState> _editcontactkey = GlobalKey<FormState>();

  final TextEditingController _firstnamecontroller = TextEditingController();
  final TextEditingController _lastnamecontroller = TextEditingController();
  final TextEditingController _phonenumbercontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();

  String? _firstname;
  String? _lastname;
  String? _phonenumber;
  String? _email;
  File? _image;

  @override
  Widget build(BuildContext context) {
    dynamic data = ModalRoute.of(context)!.settings.arguments;

    _firstnamecontroller.text = data.firstname;
    _lastnamecontroller.text = data.lastname;
    _phonenumbercontroller.text = data.phonenumber;
    _emailcontroller.text = data.email;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          title[2],
          style: MyStyle.screenName,
        ),
      ),
      body: ColorfulSafeArea(
        color: MyColors.primarywhite,
        child: Form(
          key: _editcontactkey,
          child: Container(
            padding: MyPadding.paddingsecond,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyStyle.sizedbox4,
                  Text(
                    hintText[0],
                    style: MyStyle.formStyle,
                  ),
                  MyStyle.sizedbox6,
                  TextFormField(
                    controller: _firstnamecontroller,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return texts[1];
                      }
                      return null;
                    },
                    onSaved: (val) {
                      setState(() {
                        _firstname = val;
                      });
                    },
                    decoration: InputDecoration(
                        border: const UnderlineInputBorder(),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: MyColors.primarygrey,
                          ),
                        ),
                        hintText: hintText[0]),
                  ),
                  MyStyle.sizedbox4,
                  Text(
                    hintText[1],
                    style: MyStyle.formStyle,
                  ),
                  MyStyle.sizedbox6,
                  TextFormField(
                    controller: _lastnamecontroller,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return texts[2];
                      }
                      return null;
                    },
                    onSaved: (val) {
                      setState(() {
                        _lastname = val;
                      });
                    },
                    decoration: InputDecoration(
                        border: const UnderlineInputBorder(),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: MyColors.primarygrey,
                          ),
                        ),
                        hintText: hintText[1]),
                  ),
                  MyStyle.sizedbox4,
                  Text(
                    hintText[4],
                    style: MyStyle.formStyle,
                  ),
                  MyStyle.sizedbox6,
                  TextFormField(
                    controller: _phonenumbercontroller,
                    keyboardType: TextInputType.phone,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return texts[3];
                      }
                      return null;
                    },
                    onSaved: (val) {
                      setState(() {
                        _phonenumber = val;
                      });
                    },
                    decoration: InputDecoration(
                        border: const UnderlineInputBorder(),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: MyColors.primarygrey,
                          ),
                        ),
                        hintText: hintText[2]),
                  ),
                  MyStyle.sizedbox4,
                  Text(
                    hintText[3],
                    style: MyStyle.formStyle,
                  ),
                  MyStyle.sizedbox6,
                  TextFormField(
                    controller: _emailcontroller,
                    keyboardType: TextInputType.emailAddress,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return texts[4];
                      }
                      return null;
                    },
                    onSaved: (val) {
                      setState(() {
                        _email = val;
                      });
                    },
                    decoration: InputDecoration(
                        border: const UnderlineInputBorder(),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: MyColors.primarygrey,
                          ),
                        ),
                        hintText: hintText[3]),
                  ),
                  MyStyle.sizedbox1,
                  Row(
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.of(context).pop();
                          _firstnamecontroller.clear();
                          _lastnamecontroller.clear();
                          _phonenumbercontroller.clear();
                          _emailcontroller.clear();
                          setState(() {
                            _firstname = "";
                            _lastname = "";
                            _phonenumber = "";
                            _email = "";
                          });
                        },
                        icon: MyStyle.arrowBackIcon,
                        label: Text(buttonText[1]),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: MyColors.primarydeeppurple),
                      ),
                      MyStyle.sizedbox3,
                      ElevatedButton.icon(
                        onPressed: () {
                          if (_editcontactkey.currentState!.validate()) {
                            _editcontactkey.currentState!.save();

                            Contact c = Contact(
                              firstname: _firstname,
                              lastname: _lastname,
                              phonenumber: _phonenumber,
                              email: _email,
                              image: _image,
                            );

                            int i = Global.allcontacts.indexOf(data);

                            Global.allcontacts[i] = (c);

                            Navigator.of(context).pushNamedAndRemoveUntil(
                                'homepage', (route) => false);
                          }
                        },
                        icon: const Icon(Icons.update),
                        label: Text(texts[6]),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: MyColors.primarydeeppurple,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
