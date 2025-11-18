import 'package:flutter/material.dart';
import '../widgets/atm_card.dart';
import '../widgets/transaction_item.dart';
import '../models/transaction.dart';
// import '../widgets/grid_menu_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final transactions = [
      TransactionModel('Belanja Kebutuhan', '-Rp100.000', 'Acara'),
      TransactionModel('Bensin', '-Rp25.000', 'Kendaraan'),
      TransactionModel('Bakso', '-Rp10.000', 'Makanan'),
      TransactionModel('Nonton Anime "Colorful Stage! The Movie: A Miku Who Cant Sing"', '-Rp45.000', 'Acara'),
      TransactionModel('Saldo Masuk', '+Rp7.500.000', 'Pemasukan'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Finance Duo "A"'),
        centerTitle: true,
        backgroundColor: Colors.cyan,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ===== Title =====
            const Text(
              'Kartu Bank',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // ===== Banner Cards =====
            SizedBox(
              height: 220,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  AtmCard(
                    bankName: 'Ahmad',
                    cardNumber: '**** 3287',
                    balance: 'Rp7.500.000',
                    color1: Colors.cyan,
                    color2: Colors.deepPurple,
                  ),
                  AtmCard(
                    bankName: 'Ananda',
                    cardNumber: '**** 2838',
                    balance: 'Rp7.500.000',
                    color1: Colors.cyan,
                    color2: Colors.deepPurple,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ===== Grid Menu =====
            GridView.count(
                crossAxisCount: 5, // Jumlah Grid per baris
                crossAxisSpacing: 16,
                shrinkWrap: true,
                mainAxisSpacing: 20,
                physics: const NeverScrollableScrollPhysics(),
                childAspectRatio: 1.4,
                children: const [
                  _MenuItem(icon: Icons.health_and_safety, label: 'Kesehatan'),
                  _MenuItem(icon: Icons.travel_explore, label: 'Kendaraan'),
                  _MenuItem(icon: Icons.fastfood, label: 'Makanan'),
                  _MenuItem(icon: Icons.calendar_month_rounded, label: 'Jadwal'),
                  _MenuItem(icon: Icons.event, label: 'Acara'),
                ],
              ),

            const SizedBox(height: 24),

            // ===== Transaction List =====
            const Text(
              'Transaksi Terakhir',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                return TransactionItem(transaction: transactions[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}

// ---- Grid Menu Item Widget ----
class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _MenuItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: Colors.cyan.withOpacity(0.1),
          child: Icon(icon, color: Colors.deepPurple),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
