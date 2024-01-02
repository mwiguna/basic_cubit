import 'package:basic_cubit/ui/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text("Profil"),

            GestureDetector(
              onTap: () => Get.off(DashboardPage()),
              child: Container(
                width: 100,
                color: Colors.teal,
                child: Text("Pindah", style: TextStyle(color: Colors.white)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
