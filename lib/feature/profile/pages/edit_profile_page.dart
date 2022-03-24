import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hackathon_app/core/utils/style.dart';
import 'package:hackathon_app/core/widget/primary_text_form_field.dart';
import 'package:hackathon_app/feature/consultation/model/Topic.dart';
import 'package:hackathon_app/feature/consultation/stores/consultant_data.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  ConsultantData _consultantData = ConsultantData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Ubah Profile',
          style: Style.headline6,
        ),
        iconTheme: IconThemeData(
          color: Style.black,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'Save',
              style: Style.headline6.copyWith(
                fontWeight: FontWeight.normal,
                color: Style.secondaryColor,
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1541855492-581f618f69a0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=80'),
              ),
              PrimaryTextFormField(
                  hintText: 'Nama',
                  validator: (string) {},
                  controller: TextEditingController()),
              SizedBox(
                height: 16,
              ),
              PrimaryTextFormField(
                  keyboardType: TextInputType.emailAddress,
                  hintText: 'Email',
                  validator: (string) {},
                  controller: TextEditingController()),
              SizedBox(
                height: 16,
              ),
              PrimaryTextFormField(
                  keyboardType: TextInputType.phone,
                  hintText: 'No Hp',
                  validator: (string) {},
                  controller: TextEditingController()),
              SizedBox(
                height: 16,
              ),
              PrimaryTextFormField(
                  hintText: 'Kota',
                  validator: (string) {},
                  controller: TextEditingController()),
            ],
          ),
        ),
      ),
    );
  }
}
