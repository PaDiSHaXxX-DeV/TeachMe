import 'package:flutter/material.dart';
import 'package:teachme/data/models/user/user_data.dart';
import 'package:teachme/pages/profile/widgets/appbar_widget.dart';
import 'package:teachme/widgets/Global_button.dart';

// This class handles the Page to edit the About Me Section of the User Profile.
class EditDescriptionFormPage extends StatefulWidget {
  @override
  _EditDescriptionFormPageState createState() =>
      _EditDescriptionFormPageState();
}

class _EditDescriptionFormPageState extends State<EditDescriptionFormPage> {
  final _formKey = GlobalKey<FormState>();
  final descriptionController = TextEditingController();
  var user = UserData.myUser;

  @override
  void dispose() {
    descriptionController.dispose();
    super.dispose();
  }

  void updateUserValue(String description) {
    user.aboutMeDescription = description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF1A434E),
        appBar: buildAppBar(context),
        body: Form(
          key: _formKey,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                    width: 350,
                    child: Text(
                      "What type of passenger\nare you?",
                      style: TextStyle(
                          color: Colors.orange.shade300,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    )),
                Padding(
                    padding: const EdgeInsets.all(20),
                    child: SizedBox(
                        height: 250,
                        width: 350,
                        child: TextFormField(
                          // Handles Form Validation
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value.length > 200) {
                              return 'Please describe yourself but keep it under 200 characters.';
                            }
                            return null;
                          },
                          controller: descriptionController,
                          textAlignVertical: TextAlignVertical.top,
                          decoration: const InputDecoration(
                              hintStyle: TextStyle(color: Colors.white),
                              labelStyle: TextStyle(color: Colors.white),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.amber),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.amber),
                              ),
                              alignLabelWithHint: true,
                              contentPadding:
                                  EdgeInsets.fromLTRB(10, 15, 10, 100),
                              hintMaxLines: 3,
                              hintText:
                                  'Write a little bit about yourself. Do you like chatting? Are you a smoker? Do you bring pets with you? Etc.'),
                        ))),
                Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: GlobalButton(
                            width: 350,
                            height: 50,
                            buttonTitle: 'Update',
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                updateUserValue(descriptionController.text);
                                Navigator.pop(context);
                              }
                            }))),
              ]),
        ));
  }
}


