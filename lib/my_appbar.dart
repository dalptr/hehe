import 'package:flutter/material.dart';

AppBar myAppBar() {
  return AppBar(
    leading: const Icon(Icons.menu_rounded, color: Colors.black),
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.location_pin, color: Colors.red[700]),
        RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                  text: 'Chicago,',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              TextSpan(
                  text: 'IL',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey)),
            ],
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
    actions: [
      Image.asset('assets/images/avatar.png', width: 40, height: 40),
      const SizedBox(width: 15),
    ],
  );
}
