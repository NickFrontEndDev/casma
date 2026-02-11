import 'package:flutter/material.dart';
import 'package:flutter_application/Components/base_layout.dart';
import 'package:flutter_application/Views/add_kontobewegung.dart';

class SubhomeScreen extends StatefulWidget {
  final String title;
  final String amount;

  const SubhomeScreen({super.key, required this.title, required this.amount});

  @override
  State<SubhomeScreen> createState() => _SubhomeScreenState();
}

class _SubhomeScreenState extends State<SubhomeScreen> {
  List<String> selectedCategories = [
    "Auto",
    "Freizeit & Spaß",
    "Lebensmittel",
    "Miet- & Wohnaugaben",
    "Versicherungen",
  ];
  String selectedSort = "Neueste zuerst";

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      selectedIndex: 0,
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            const SizedBox(height: 25),
            // 💳 Карточка счёта
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.amount,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            Row(
              children: [
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (_) => FilterBottomSheet(
                        selectedCategories: selectedCategories,
                        selectedSort: selectedSort,
                        onApply: (categories, sort) {
                          setState(() {
                            selectedCategories = categories;
                            selectedSort = sort;
                          });
                        },
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      const Text(
                        "Filter & Sortieren",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 6),
                      const Icon(Icons.filter_list),
                    ],
                  ),
                ),
                Spacer(),

                IconButton(
                  icon: Icon(Icons.add_circle_outline),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            AddKontobewegung(title: widget.title),
                      ),
                    );
                  },
                ),
              ],
            ),

            const SizedBox(height: 15),

            _TransactionTile(
              icon: Icons.local_gas_station,
              title: "Esso Station / Leonberg",
              date: "03.02.2026",
              subtitle: "2026-02-02debitk.017...",
              amount: "-81,91 €",
              amountColor: Colors.red,
            ),

            _TransactionTile(
              icon: Icons.shopping_bag,
              title: "Edeka Schelske",
              date: "02.02.2026",
              subtitle: "2026-02-02debitk.277...",
              amount: "-63,91 €",
              amountColor: Colors.red,
            ),

            _TransactionTile(
              icon: Icons.shield,
              title: "Versicherung VHV",
              date: "01.02.2026",
              subtitle: "Vertragsnummer 2672...",
              amount: "-151,91 €",
              amountColor: Colors.red,
            ),

            _TransactionTile(
              icon: Icons.home,
              title: "CASA BONITA",
              date: "31.01.2026",
              subtitle: "Gehaltsabrechnung 30...",
              amount: "+2.481,91 €",
              amountColor: Colors.green,
            ),

            _TransactionTile(
              icon: Icons.movie,
              title: "Netflix",
              date: "31.01.2026",
              subtitle: "Rechnung 26726191",
              amount: "-13,99 €",
              amountColor: Colors.red,
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

// 🔹 Компонент строки транзакции
class _TransactionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String date;
  final String subtitle;
  final String amount;
  final Color amountColor;

  const _TransactionTile({
    required this.icon,
    required this.title,
    required this.date,
    required this.subtitle,
    required this.amount,
    required this.amountColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Colors.black87),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                ),
                const SizedBox(height: 2),
                Text(
                  date,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
                ),
              ],
            ),
          ),

          Text(
            amount,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: amountColor,
            ),
          ),
        ],
      ),
    );
  }
}

class FilterBottomSheet extends StatefulWidget {
  final List<String> selectedCategories;
  final String selectedSort;
  final Function(List<String>, String) onApply;
  const FilterBottomSheet({
    super.key,
    required this.selectedCategories,
    required this.selectedSort,
    required this.onApply,
  });
  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  late List<String> categories;
  late String sort;
  final allCategories = [
    "Auto",
    "Freizeit & Spaß",
    "Lebensmittel",
    "Miet- & Wohnaugaben",
    "Versicherungen",
  ];
  final sortOptions = [
    "Neueste zuerst",
    "Älteste zuerst",
    "Alphabetisch A-Z",
    "Alphabetisch Z-A",
    "Höchste zuerst",
    "Niedrigste zuerst",
  ];
  @override
  void initState() {
    super.initState();
    categories = List.from(widget.selectedCategories);
    sort = widget.selectedSort;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 5,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const Text(
            "Kategorien",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 12),
          ...allCategories.map((cat) {
            final isSelected = categories.contains(cat);
            return CheckboxListTile(
              value: isSelected,
              title: Text(cat),
              onChanged: (v) {
                setState(() {
                  if (v == true) {
                    categories.add(cat);
                  } else {
                    categories.remove(cat);
                  }
                });
              },
            );
          }),
          const SizedBox(height: 20),
          const Text(
            "Sortieren nach",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 12),
          ...sortOptions.map((option) {
            return RadioListTile(
              value: option,
              // ignore: deprecated_member_use
              groupValue: sort,
              title: Text(option),
              // ignore: deprecated_member_use
              onChanged: (v) {
                setState(() => sort = v!);
              },
            );
          }),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                widget.onApply(categories, sort);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Übernehmen",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
