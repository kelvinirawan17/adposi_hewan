import 'dart:ui';
import './login.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _obscureText = true;
  // ignore: unused_field
  String _password;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.fromLTRB(50, 100, 50, 150),
              color: Colors.teal[800],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    child: Center(
                      child: Image.asset(
                        "assets/images/icon.png",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "SELAMAT DATANG",
                    style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "DI ADOPSI HEWAN",
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(100.0),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(100.0),
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.edit,
                        size: 30,
                        color: Colors.white,
                      ),
                      filled: true,
                      hintText: "Masukkan nama...",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "Nama Lengkap",
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(100.0),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(100.0),
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.person,
                        size: 30,
                        color: Colors.white,
                      ),
                      filled: true,
                      hintText: "Masukkan username...",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "Username",
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(100.0),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(100.0),
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.alternate_email,
                        size: 30,
                        color: Colors.white,
                      ),
                      filled: true,
                      hintText: "Masukkan email...",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "Email",
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(100.0),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(100.0),
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.lock,
                        size: 30,
                        color: Colors.white,
                      ),
                      suffixIcon: FlatButton(
                        onPressed: _toggle,
                        child: new Icon(
                          _obscureText
                              ? Icons.remove_red_eye
                              : Icons.remove_red_eye_outlined,
                          color: Colors.white,
                        ),
                      ),
                      filled: true,
                      hintText: "Masukkan password...",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "Password",
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    validator: (val) =>
                        val.length < 6 ? 'Password too short.' : null,
                    onSaved: (val) => _password = val,
                    obscureText: _obscureText,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(100.0),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(100.0),
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.lock,
                        size: 30,
                        color: Colors.white,
                      ),
                      suffixIcon: FlatButton(
                        onPressed: _toggle,
                        child: new Icon(
                          _obscureText
                              ? Icons.remove_red_eye
                              : Icons.remove_red_eye_outlined,
                          color: Colors.white,
                        ),
                      ),
                      filled: true,
                      hintText: "Konfirmasi password...",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "Konfirmasi Password",
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    validator: (val) =>
                        val.length < 6 ? 'Password too short.' : null,
                    onSaved: (val) => _password = val,
                    obscureText: _obscureText,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Card(
                    color: Colors.white,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    child: Container(
                      height: 50,
                      child: InkWell(
                        splashColor: Colors.teal[800],
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          );
                        },
                        child: Center(
                          child: Text(
                            "DAFTAR",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.teal[800],
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
