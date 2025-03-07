import 'package:flutter/material.dart';
import 'package:flutter_app_desvita/Screen/page_satu.dart';
import 'package:flutter_app_desvita/Screen/page_dua.dart';
import 'package:flutter_app_desvita/Screen/page_tiga.dart';
import 'package:flutter_app_desvita/Screen/page_form_login.dart';
import 'package:flutter_app_desvita/Screen/page_form_register.dart';
import 'package:flutter_app_desvita/Screen/page_gambar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobile Apps MI2C'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding di sekitar ListView
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10), // Jarak antara AppBar dan ListView
            Expanded(
              child: ListView(
                children: [
                  _buildListTile(context, 'Satu', const PageSatu()),
                  _buildListTile(context, 'Register', const PageFormRegister()),
                  _buildListTile(context, 'Dua', const PageDua()),
                  _buildListTile(context, 'Tiga', const PageTiga()),
                  _buildListTile(context, 'Login', const PageFormLogin()),
                  _buildListTile(context, 'Gambar', const PageGambar()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(BuildContext context, String title, Widget page) {
    return Card(
      elevation: 2, // Elevasi diperkecil
      margin: const EdgeInsets.symmetric(vertical: 4), // Margin diperkecil
      color: Colors.greenAccent, // Warna latar belakang greenAccent
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => page));
        },
        child: Container(
          height: 38, // Tinggi kotak diperpendek
          padding: const EdgeInsets.symmetric(horizontal: 16), // Padding horizontal
          child: Center(
            child: Text(
              title,
              style: const TextStyle(fontSize: 16, color: Colors.black), // Teks dengan warna hitam
            ),
          ),
        ),
      ),
    );
  }
}