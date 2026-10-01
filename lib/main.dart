
import 'package:flutter/material.dart';

void main() {
  runApp(const CekBarangApp());
}

class CekBarangApp extends StatelessWidget {
  const CekBarangApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cek Barang Warung Pro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = TextEditingController();
    final pass = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "CEK BARANG WARUNG PRO",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            TextField(controller: user, decoration: const InputDecoration(labelText:"Username")),
            TextField(controller: pass, obscureText:true, decoration: const InputDecoration(labelText:"Password")),
            const SizedBox(height:20),
            ElevatedButton(
              child: const Text("LOGIN"),
              onPressed: (){
                Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const DashboardPage()));
              },
            )
          ],
        ),
      ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final warung = List.generate(20, (i)=>"Cek Warung ${i+1}");

    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard Owner")),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          const Card(
            child: ListTile(
              title: Text("Total Barang"),
              subtitle: Text("1999 Item"),
            ),
          ),
          const Card(
            child: ListTile(
              title: Text("Jumlah Lembar"),
              subtitle: Text("20 Lembar Cek"),
            ),
          ),
          const Text(
            "Daftar Lembar Cek",
            style: TextStyle(fontSize:20,fontWeight:FontWeight.bold),
          ),
          ...warung.map((e)=>Card(
            child: ListTile(
              title: Text(e),
              trailing: const Icon(Icons.arrow_forward),
              onTap: (){
                Navigator.push(context,
                  MaterialPageRoute(builder:(_)=>CekBarangPage(nama:e)));
              },
            ),
          ))
        ],
      ),
    );
  }
}

class CekBarangPage extends StatelessWidget {
  final String nama;
  const CekBarangPage({super.key, required this.nama});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(nama)),
      body: ListView(
        children:[
          item("Indomie Goreng"),
          item("Minyak Goreng"),
          item("Gula Pasir"),
        ],
      ),
    );
  }

  Widget item(String nama){
    return Card(
      margin: const EdgeInsets.all(10),
      child: ListTile(
        title: Text(nama),
        subtitle: const TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(labelText:"Jumlah Stok"),
        ),
      ),
    );
  }
}
