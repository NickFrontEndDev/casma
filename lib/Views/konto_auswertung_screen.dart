import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_application/Components/base_layout.dart';
import 'package:flutter_application/Components/app_card.dart';

class KontoAuswertungScreen extends StatefulWidget {
  const KontoAuswertungScreen({super.key});

  @override
  State<KontoAuswertungScreen> createState() => _KontoAuswertungScreenState();
}

class _KontoAuswertungScreenState extends State<KontoAuswertungScreen> {
  String kontoAuswertungTitle = "Sparkasse";
  String period = "Monatlich";

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      selectedIndex: 1,
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppCard(
              child: Row(
                children: [
                  const Text(
                    "Kontoauswertung",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  DropdownButton<String>(
                    value: kontoAuswertungTitle,
                    underline: const SizedBox(),
                    items: const [
                      DropdownMenuItem(
                        value: "Sparkasse",
                        child: Row(children: [Text("Sparkasse")]),
                      ),
                      DropdownMenuItem(
                        value: "Volksbank",
                        child: Row(children: [Text("Volksbank")]),
                      ),
                    ],
                    onChanged: (v) => setState(() => kontoAuswertungTitle = v!),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            AppCard(
              child: Row(
                children: [
                  Expanded(
                    child: DropdownButton<String>(
                      value: period,
                      isExpanded: true,
                      underline: const SizedBox(),
                      items: const [
                        DropdownMenuItem(
                          value: "Jährlich",
                          child: Text("Jährlich"),
                        ),
                        DropdownMenuItem(
                          value: "Monatlich",
                          child: Text("Monatlich"),
                        ),
                        DropdownMenuItem(
                          value: "Wöchentlich",
                          child: Text("Wöchentlich"),
                        ),
                        DropdownMenuItem(
                          value: "Täglich",
                          child: Text("Täglich"),
                        ),
                      ],
                      onChanged: (v) => setState(() => period = v!),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Icon(Icons.date_range_outlined, size: 20),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Карточка диаграммы
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
                children: [
                  const Text(
                    "Ausgaben der letzten 30 Tage",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),

                  const SizedBox(height: 20),

                  SizedBox(
                    height: 220,
                    child: PieChart(
                      PieChartData(
                        sectionsSpace: 4,
                        centerSpaceRadius: 40,
                        sections: _buildSections(),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  _LegendItem(
                    color: const Color(0xff4CAF50),
                    title: "Miet- & Wohnaugaben",
                    amount: "855,29 €",
                  ),
                  _LegendItem(
                    color: const Color(0xff2196F3),
                    title: "Lebensmittel",
                    amount: "475,00 €",
                  ),
                  _LegendItem(
                    color: const Color(0xffFF9800),
                    title: "Auto",
                    amount: "361,00 €",
                  ),
                  _LegendItem(
                    color: const Color(0xffE91E63),
                    title: "Freizeit & Spaß",
                    amount: "209,00 €",
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // Диаграмма
  List<PieChartSectionData> _buildSections() {
    return [
      PieChartSectionData(
        color: const Color(0xff4CAF50),
        value: 45,
        title: "45%",
        radius: 60,
        titleStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      PieChartSectionData(
        color: const Color(0xff2196F3),
        value: 25,
        title: "25%",
        radius: 60,
        titleStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      PieChartSectionData(
        color: const Color(0xffFF9800),
        value: 19,
        title: "19%",
        radius: 60,
        titleStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      PieChartSectionData(
        color: const Color(0xffE91E63),
        value: 11,
        title: "11%",
        radius: 60,
        titleStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ];
  }
}

// Элемент списка категорий
class _LegendItem extends StatelessWidget {
  final Color color;
  final String title;
  final String amount;

  const _LegendItem({
    required this.color,
    required this.title,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Container(
            width: 14,
            height: 14,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ),
          Text(
            amount,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
