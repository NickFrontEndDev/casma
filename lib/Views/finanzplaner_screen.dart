import 'package:flutter/material.dart';
import 'package:flutter_application/Components/base_layout.dart';
import 'package:flutter_application/Components/app_card.dart';
import 'package:flutter_application/Components/daily_finance_table.dart';
import 'package:flutter_application/Models/finance_entry.dart';

class FinanzplanerScreen extends StatefulWidget {
  const FinanzplanerScreen({super.key});

  @override
  State<FinanzplanerScreen> createState() => _FinanzplanerScreenState();
}

class _FinanzplanerScreenState extends State<FinanzplanerScreen> {
  String kontoName = "Sparkasse";

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      selectedIndex: 3,
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Заголовок + выбор счёта
            AppCard(
              child: Row(
                children: [
                  const Text(
                    "Finanzplaner",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  DropdownButton<String>(
                    value: kontoName,
                    underline: const SizedBox(),
                    items: const [
                      DropdownMenuItem(
                        value: "Sparkasse",
                        child: Text("Sparkasse"),
                      ),
                      DropdownMenuItem(
                        value: "Volksbank",
                        child: Text("Volksbank"),
                      ),
                    ],
                    onChanged: (v) => setState(() => kontoName = v!),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 🔹 Текущий баланс
            AppCard(
              child: Row(
                children: const [
                  Text(
                    "Aktueller Saldo",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Spacer(),
                  Text(
                    "2.541,28 €",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 🔹 Таблицы по дням
            DailyFinanceTable(
              date: "30. Apr. 26",
              balance: "2.541,28 €",
              entries: [
                FinanceEntry(title: "Miete", amount: -852.95),
                FinanceEntry(title: "KFZ-Versicherung", amount: -105.37),
              ],
            ),

            DailyFinanceTable(
              date: "1. Mai. 26",
              balance: "2.541,28 €",
              entries: [],
            ),

            DailyFinanceTable(
              date: "2. Mai. 26",
              balance: "2.527,29 €",
              entries: [FinanceEntry(title: "Netflix", amount: -13.99)],
            ),

            DailyFinanceTable(
              date: "3. Mai. 26",
              balance: "2.541,28 €",
              entries: [],
            ),

            DailyFinanceTable(
              date: "4. Mai. 26",
              balance: "2.541,28 €",
              entries: [],
            ),

            DailyFinanceTable(
              date: "5. Mai. 26",
              balance: "2.374,47 €",
              entries: [],
            ),

            DailyFinanceTable(
              date: "6. Mai. 26",
              balance: "2.354,12 €",
              entries: [],
            ),

            DailyFinanceTable(
              date: "7. Mai. 26",
              balance: "2.341,28 €",
              entries: [],
            ),

            DailyFinanceTable(
              date: "8. Mai. 26",
              balance: "2.140,12 €",
              entries: [],
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
