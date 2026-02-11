import 'package:flutter/material.dart';
import 'package:flutter_application/Components/base_layout.dart';
import 'package:flutter_application/Views/subhome_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      selectedIndex: 0,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Text(
                "Sie haben 23% weniger Ausgaben zum Vormonat",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              "Übersicht",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            _AccountTile(title: "Gesamt", amount: "4.938,47 €", bold: true),
            _AccountTile(title: "Konto Sparkasse", amount: "2.658,32 €"),
            _AccountTile(title: "Tagesgeldkonto Volksbank", amount: "293,00 €"),
            _AccountTile(title: "Bargeld", amount: "55,00 €"),
            _AccountTile(title: "Trade Republic", amount: "1.932,15 €"),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class _AccountTile extends StatelessWidget {
  final String title;
  final String amount;
  final bool bold;

  const _AccountTile({
    required this.title,
    required this.amount,
    this.bold = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SubhomeScreen(
              title: title,
              amount: amount,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: bold ? 18 : 16,
                fontWeight: bold ? FontWeight.bold : FontWeight.w500,
              ),
            ),
            Text(
              amount,
              style: TextStyle(
                fontSize: bold ? 18 : 16,
                fontWeight: bold ? FontWeight.bold : FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}