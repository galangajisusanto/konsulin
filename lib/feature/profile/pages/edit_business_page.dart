import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hackathon_app/core/utils/style.dart';
import 'package:hackathon_app/core/widget/primary_text_form_field.dart';
import 'package:hackathon_app/feature/consultation/model/Topic.dart';
import 'package:hackathon_app/feature/consultation/stores/consultant_data.dart';

class EditBusinessPage extends StatefulWidget {
  @override
  _EditBusinessPageState createState() => _EditBusinessPageState();
}

class _EditBusinessPageState extends State<EditBusinessPage> {
  ConsultantData _consultantData = ConsultantData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Data UMKM',
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
              PrimaryTextFormField(
                  hintText: 'Nama UMMKM',
                  validator: (string) {},
                  controller: TextEditingController()),
              SizedBox(
                height: 16,
              ),
              PrimaryTextFormField(
                  hintText: 'Bidang UMKM',
                  validator: (string) {},
                  controller: TextEditingController()),
              SizedBox(
                height: 16,
              ),
              PrimaryTextFormField(
                  hintText: 'Deskripsi',
                  validator: (string) {},
                  controller: TextEditingController()),
              SizedBox(
                height: 16,
              ),
              PrimaryTextFormField(
                  hintText: 'Tahun Mulai',
                  keyboardType: TextInputType.number,
                  validator: (string) {},
                  controller: TextEditingController()),
            ],
          ),
        ),
      ),
    );
  }
}
