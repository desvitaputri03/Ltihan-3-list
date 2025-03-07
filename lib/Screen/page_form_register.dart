import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';


class PageFormRegister extends StatefulWidget {
  const PageFormRegister({super.key});

  @override
  State<PageFormRegister> createState() => _PageFormRegisterState();
}

class _PageFormRegisterState extends State<PageFormRegister> {
  // Deklarasi TextEditingController
  TextEditingController etFullName = TextEditingController();
  TextEditingController etUsername = TextEditingController();
  TextEditingController etEmail = TextEditingController();
  TextEditingController etPassword = TextEditingController();
  TextEditingController etTglLahir = TextEditingController();
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  // Fungsi untuk memilih tanggal
  Future selectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(1900),
      lastDate: DateTime(2025),
    );

    if (pickedDate != null) {
      setState(() {
        etTglLahir.text = DateFormat("dd-MM-yyyy").format(pickedDate);
      });
    }
  }

  // Fungsi untuk menampilkan toast
  void _showToast() {
    String message =
        "Full Name: ${etFullName.text}\nUsername: ${etUsername.text}\nEmail: ${etEmail.text}\nPassword: ${etPassword.text}\nTanggal Lahir: ${etTglLahir.text}";

    showToast(
      message,
      context: context,
      animation: StyledToastAnimation.fade,
      reverseAnimation: StyledToastAnimation.fade,
      position: StyledToastPosition.bottom,
      duration: Duration(seconds: 3),
      backgroundColor: Colors.black87,
      textStyle: TextStyle(color: Colors.white),
      borderRadius: BorderRadius.circular(10),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text('Page Register'),
        centerTitle: true,
      ),
      body: Form(
        key: keyForm,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: etFullName,
                  validator: (val) {
                    return val!.isEmpty ? "Tidak boleh kosong" : null;
                  },
                  decoration: InputDecoration(
                    hintText: "Full Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: etUsername,
                  validator: (val) {
                    return val!.isEmpty ? "Tidak boleh kosong" : null;
                  },
                  decoration: InputDecoration(
                    hintText: "Username",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: etEmail,
                  validator: (val) {
                    return val!.isEmpty ? "Tidak boleh kosong" : null;
                  },
                  decoration: InputDecoration(
                    hintText: "Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: etPassword,
                  validator: (val) {
                    return val!.isEmpty ? "Tidak boleh kosong" : null;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  onTap: () {
                    FocusScope.of(context).requestFocus(new FocusNode());
                    selectDate();
                  },
                  controller: etTglLahir,
                  validator: (val) {
                    return val!.isEmpty ? "Tidak boleh kosong" : null;
                  },
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: "Tanggal Lahir",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                MaterialButton(
                  onPressed: () {
                    if (keyForm.currentState!.validate()) {
                      _showToast();
                    }
                  },
                  color: Colors.red,
                  minWidth: 200,
                  height: 45,
                  child: Text('REGISTER', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}