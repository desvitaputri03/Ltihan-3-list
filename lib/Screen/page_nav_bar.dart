import 'package:flutter/material.dart';
import 'package:flutter_app_desvita/Screen/page_dua.dart';
import 'package:flutter_app_desvita/Screen/page_form_register.dart';
import 'package:flutter_app_desvita/Screen/page_gambar.dart';
import 'package:flutter_app_desvita/Screen/page_satu.dart';
import 'package:flutter_app_desvita/Screen/page_form_login.dart';
import 'package:flutter_app_desvita/Screen/page_tiga.dart';

class PageNavBar extends StatefulWidget {
  const PageNavBar({super.key});

  @override
  State<PageNavBar> createState() => _PageNavbarState();
}

class _PageNavbarState extends State<PageNavBar> with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 6, vsync: this); // Sesuaikan panjang dengan jumlah tab
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Hapus AppBar dari sini
      body: TabBarView(
        controller: tabController,
        children: const [
          PageSatu(),
          PageFormRegister(),
          PageDua(),
          PageTiga(),
          PageFormLogin(),
          PageGambar(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: TabBar(
          isScrollable: true,
          labelColor: Colors.blueAccent,
          unselectedLabelColor: Colors.purple,
          controller: tabController,
          tabs: const [
            Tab(
              text: "Satu",
              icon: Icon(Icons.assignment),
            ),
            Tab(
              text: "Register",
              icon: Icon(Icons.photo),
            ),
            Tab(
              text: "Dua",
              icon: Icon(Icons.assignment),
            ),
            Tab(
              text: "Tiga",
              icon: Icon(Icons.beach_access),
            ),
            Tab(
              text: "Login",
              icon: Icon(Icons.favorite),
            ),
            Tab(
              text: "Gambar",
              icon: Icon(Icons.photo),
            ),
          ],
        ),
      ),
    );
  }
}