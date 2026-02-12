import 'package:flutter/material.dart';
import 'package:flutter_application/Models/finance_entry.dart';

class DailyFinanceTable extends StatefulWidget {
  final String date;
  final String balance;
  final List<FinanceEntry> entries;

  const DailyFinanceTable({
    super.key,
    required this.date,
    required this.balance,
    required this.entries,
  });

  @override
  State<DailyFinanceTable> createState() => _DailyFinanceTableState();
}

class _DailyFinanceTableState extends State<DailyFinanceTable> {
  bool isExpanded = false; // 🔥 по умолчанию свернуто

  double get totalAmount => widget.entries.fold(0, (sum, e) => sum + e.amount);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
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
          // 🔹 HEADER — всегда виден
          GestureDetector(
            onTap: () => setState(() => isExpanded = !isExpanded),
            behavior: HitTestBehavior.opaque,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // 🔥 Галочка (анимация)
                    AnimatedRotation(
                      turns: isExpanded ? 0.5 : 0,
                      duration: const Duration(milliseconds: 200),
                      child: const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: 24,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 8),

                    // Дата
                    Text(
                      widget.date,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),

                // Баланс
                Text(
                  widget.balance,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          // 🔹 Контент — показывается только если раскрыто
          AnimatedCrossFade(
            firstChild: const SizedBox.shrink(),
            secondChild: _buildExpandedContent(),
            crossFadeState: isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 200),
          ),
        ],
      ),
    );
  }

  Widget _buildExpandedContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),

        // Список транзакций
        if (widget.entries.isEmpty)
          const Text(
            "Keine geplanten Ausgaben",
            style: TextStyle(fontSize: 14, color: Colors.grey),
          )
        else
          Column(
            children: widget.entries.map((entry) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      entry.title,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      _formatAmount(entry.amount),
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: entry.amount < 0 ? Colors.red : Colors.green,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),

        const SizedBox(height: 12),

        // Итог
        if (widget.entries.isNotEmpty)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Summe Beträge",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
              Text(
                _formatAmount(totalAmount),
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: totalAmount < 0 ? Colors.red : Colors.green,
                ),
              ),
            ],
          ),
      ],
    );
  }

  String _formatAmount(double value) {
    return "${value.toStringAsFixed(2).replaceAll('.', ',')} €";
  }
}
