import 'package:basic_cubit/cubit/coin_cubit.dart';
import 'package:basic_cubit/ui/profil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              BlocBuilder<CoinCubit, CoinState>(
                builder: (context, dataState) {

                  if(dataState is CoinLoaded) {
                    return Column(
                      children: [
                        Text("Sudah load data : "),
                        Text(dataState.coin.name),
                      ],
                    );
                  } else if (dataState is CoinInitial) {
                    return Text("Masih inisialisasi");
                  } else if (dataState is CoinLoading) {
                    return Text("Loading...");
                  } else {
                    return Text("Tidak terdefinisi");
                  }

                }
              ),

              GestureDetector(
                onTap: () async {
                  await context.read<CoinCubit>().getCoin();
                  setState(() {});
                },
                child: Container(
                  width: 100,
                  color: Colors.teal,
                  child: Text("Load", textAlign: TextAlign.center, style: TextStyle(color: Colors.white)),
                ),
              ),

              WidgetHotel("Hotel Amaris"),
              WidgetHotel("Hotel BW"),
              WidgetHotel("Hotel Aston"),

              GestureDetector(
                onTap: () => Get.to(ProfilPage()),
                child: Container(
                  width: 100,
                  color: Colors.teal,
                  child: Text("Pindah", style: TextStyle(color: Colors.white)),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  WidgetHotel(String nama) {
    return Column(
      children: [
        Text(nama, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        Text("Ini adalah hotel yang bagus"),
        Divider(),
      ],
    );
  }

}
