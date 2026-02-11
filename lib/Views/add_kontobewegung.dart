import 'package:flutter/material.dart';
import 'package:flutter_application/Components/base_layout.dart';

class AddKontobewegung extends StatefulWidget {
  final String? title;

  const AddKontobewegung({super.key, this.title});

  @override
  State<AddKontobewegung> createState() => _AddKontobewegungState();
}

class _AddKontobewegungState extends State<AddKontobewegung> {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _senderController = TextEditingController();
  final TextEditingController _purposeController = TextEditingController();

  String? konto;
  String einAusgabe = "Ausgabe";
  String selectedCategory = "Auto";
  String recurring = "Keine";

  @override
  void initState() {
    super.initState();
    konto = widget.title;
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      selectedIndex: 1,
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔙 Back button
            if (konto != null)
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
                  onPressed: () => Navigator.pop(context),
                ),
              ),

            const SizedBox(height: 25),

            const Text(
              "Kontobewegung hinzufügen",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
            ),

            const SizedBox(height: 25),

            // 📎 Upload
            _card(
              child: Row(
                children: [
                  const Icon(Icons.upload_file, size: 28),
                  const SizedBox(width: 12),
                  const Text(
                    "Foto oder Datei hochladen",
                    style: TextStyle(fontSize: 16),
                  ),
                  const Spacer(),
                  Icon(Icons.chevron_right, color: Colors.grey.shade600),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 🧾 Konto
            _card(
              child: Row(
                children: [
                  const Text(
                    "Konto",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  DropdownButton<String>(
                    value: konto,
                    hint: const Text(
                      "Kein Konto ausgewählt",
                      style: TextStyle(color: Colors.red),
                    ),
                    underline: const SizedBox(),
                    items: [
                      DropdownMenuItem(
                        value: "Konto Sparkasse",
                        child: Text("Konto Sparkasse"),
                      ),
                      DropdownMenuItem(
                        value: "Konto Volksbank",
                        child: Text("Konto Volksbank"),
                      ),
                    ],
                    onChanged: (v) => setState(() => konto = v!),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 📅 Datum
            _card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Datum der Buchung",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _dateController,
                    decoration: InputDecoration(
                      hintText: "tt.mm.jjjj",
                      suffixIcon: const Icon(Icons.calendar_today),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 👤 Sender / Empfänger
            _inputCard("Absender/Empfänger", _senderController),

            const SizedBox(height: 20),

            // 📝 Verwendungszweck
            _inputCard("Verwendungszweck", _purposeController),

            const SizedBox(height: 20),

            // 🔄 Ein/Ausgabe
            _card(
              child: Row(
                children: [
                  const Text(
                    "Ein- oder Ausgabe",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  DropdownButton<String>(
                    value: einAusgabe,
                    underline: const SizedBox(),
                    items: const [
                      DropdownMenuItem(
                        value: "Einnahme",
                        child: Text("Einnahme"),
                      ),
                      DropdownMenuItem(
                        value: "Ausgabe",
                        child: Text("Ausgabe"),
                      ),
                    ],
                    onChanged: (v) => setState(() => einAusgabe = v!),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 🏷 Kategorie
            _card(
              child: Row(
                children: [
                  const Text(
                    "Kategorie",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  DropdownButton<String>(
                    value: selectedCategory,
                    underline: const SizedBox(),
                    items: const [
                      DropdownMenuItem(
                        value: "Auto",
                        child: Row(
                          children: [
                            Icon(Icons.directions_car),
                            SizedBox(width: 8),
                            Text("Auto"),
                          ],
                        ),
                      ),
                      DropdownMenuItem(
                        value: "Essen",
                        child: Row(
                          children: [
                            Icon(Icons.restaurant),
                            SizedBox(width: 8),
                            Text("Essen"),
                          ],
                        ),
                      ),
                      DropdownMenuItem(
                        value: "Shopping",
                        child: Row(
                          children: [
                            Icon(Icons.shopping_bag),
                            SizedBox(width: 8),
                            Text("Shopping"),
                          ],
                        ),
                      ),
                    ],
                    onChanged: (v) => setState(() => selectedCategory = v!),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 🔁 Wiederkehrende Buchung
            _card(
              child: Row(
                children: [
                  const Text(
                    "Wiederkehrende Buchung",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  DropdownButton<String>(
                    value: recurring,
                    underline: const SizedBox(),
                    items: const [
                      DropdownMenuItem(value: "Keine", child: Text("Keine")),
                      DropdownMenuItem(
                        value: "Monatlich",
                        child: Text("Monatlich"),
                      ),
                      DropdownMenuItem(
                        value: "Jährlich",
                        child: Text("Jährlich"),
                      ),
                    ],
                    onChanged: (v) => setState(() => recurring = v!),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // 🔘 Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade400,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Abbrechen",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade600,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Hinzufügen",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // 🔹 Универсальная карточка
  Widget _card({required Widget child}) {
    return Container(
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
      child: child,
    );
  }

  // 🔹 Карточка с TextField
  Widget _inputCard(String label, TextEditingController controller) {
    return _card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.shade100,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
