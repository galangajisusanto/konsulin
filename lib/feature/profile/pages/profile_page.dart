import 'package:flutter/material.dart';
import 'package:hackathon_app/core/utils/style.dart';
import 'package:hackathon_app/core/widget/profile_menu.dart';
import 'package:hackathon_app/feature/profile/pages/about_app_page.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Profile',
          style: Style.headline6,
        ),
      ),
      body: SafeArea(
        child: Container(
          child: ListView(
            children: [
              SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 90,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2100&q=80',
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Galang Aji Susanto',
                style: Style.subTitle2.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20.0,
              ),
              Divider(
                height: 1.0,
                thickness: 1.0,
              ),
              ProfileMenu(
                leading: Icon(
                  Icons.account_circle,
                  color: Style.primaryColor,
                ),
                title: 'Ubah Profil',
                onPressed: () {},
              ),
              ProfileMenu(
                leading: Icon(
                  Icons.library_books,
                  color: Style.primaryColor,
                ),
                title: 'Topik',
                onPressed: () {},
              ),
              ProfileMenu(
                leading: Icon(
                  Icons.home_rounded,
                  color: Style.primaryColor,
                ),
                title: 'Data UMKM',
                onPressed: () {},
              ),
              ProfileMenu(
                leading: Icon(
                  Icons.info_outline,
                  color: Style.primaryColor,
                ),
                title: 'Tentang Aplikasi',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutAppPage()),
                  );
                },
              ),
              ProfileMenu(
                leading: Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
                title: 'Keluar',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
