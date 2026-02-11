import 'package:flutter/material.dart';
import 'package:flutter_application/Views/home_page.dart';
import 'package:flutter_application/Views/add_kontobewegung.dart';
import 'package:material_symbols_icons/symbols.dart';

class BaseLayout extends StatefulWidget {
  final Widget child;
  final int selectedIndex;

  const BaseLayout({
    super.key,
    required this.child,
    required this.selectedIndex,
  });

  @override
  State<BaseLayout> createState() => _BaseLayoutState();
}

class _BaseLayoutState extends State<BaseLayout> {
  late final TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void _performSearch() {
    debugPrint("Поиск: ${searchController.text}");
  }

  void _onNavTap(int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomeScreen()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const AddKontobewegung()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.selectedIndex,
        onTap: _onNavTap,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle_outline), label: ""),
          BottomNavigationBarItem(icon: Icon(Symbols.bar_chart), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
      ),

      body: SafeArea(
        child: Stack(
          children: [
            // 🔥 Контент под хедером
            Padding(
              padding: const EdgeInsets.only(top: 80), // высота хедера
              child: widget.child,
            ),

            // 🔥 Фиксированный хедер
            Container(
              height: 80,
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              color: const Color(0xfff5f5f5), // фон хедера
              child: Row(
                children: [
                  Expanded(
                    child: SearchBar(
                      controller: searchController,
                      hintText: "Search",
                      leading: const Icon(Icons.search),
                      elevation: const WidgetStatePropertyAll(0),
                      backgroundColor: const WidgetStatePropertyAll(
                        Colors.white,
                      ),
                      padding: const WidgetStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 12),
                      ),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      trailing: [
                        IconButton(
                          icon: const Icon(Icons.arrow_forward),
                          onPressed: _performSearch,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 12),

                  const CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
