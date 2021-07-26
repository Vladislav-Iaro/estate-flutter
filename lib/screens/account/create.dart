import 'package:estate_social_app/constant.dart';
import 'package:estate_social_app/extensions/button.dart';
import 'package:estate_social_app/widgets/core/page.dart';
import 'package:flutter/material.dart';

class CreateAccountScreen extends StatefulWidget {
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  void firstNameChanged(text) {}

  void lastNameChanged(text) {}

  void positionChanged(value) {}

  Widget _buildDescriptionWidget() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: Offset(0, 4),
            blurRadius: 6,
          )
        ],
        color: white,
      ),
      child: paddingSmBox(
        child: TextField(
          maxLines: 4,
          decoration: InputDecoration.collapsed(
            hintText: "Description",
            hintStyle: TextStyle(color: darkGrey),
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return MainPage(
      title: 'Create an account',
      child: Container(
        child: paddingBox(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SizedBox(
                    width: 90,
                    height: 90,
                    child: FloatingActionButton(
                      backgroundColor: white,
                      onPressed: () => {},
                      child: Icon(Icons.camera_alt_rounded, color: grey),
                    ),
                  ),
                ),
                vSBox,
                TextFieldExt.builder(
                    hint: 'First Name', onChanged: firstNameChanged),
                vSBox,
                TextFieldExt.builder(
                    hint: 'Last Name', onChanged: lastNameChanged),
                vSBox,
                Row(
                  children: [
                    Expanded(
                      child: Dropdown.builder(
                        hint: 'Position',
                        onChanged: positionChanged,
                        items: ["type1", "type2", "type3"],
                      ),
                    ),
                  ],
                ),
                vSBox,
                _buildDescriptionWidget(),
                vSBox,
                TextFieldExt.builder(
                    hint: 'Phone Number', onChanged: lastNameChanged),
                vSBox,
                Row(
                  children: [
                    Expanded(
                      child: ButtonExtension.builder(
                        active: true,
                        onPressed: () =>
                            Navigator.of(context).pushNamed('/account/edit'),
                        text: "Sign Up",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
