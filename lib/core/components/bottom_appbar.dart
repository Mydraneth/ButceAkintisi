import 'package:butceakintisi/core/components/floating_action_button.dart';
import 'package:flutter/material.dart';

class CustomBottomAppBar extends StatelessWidget {
  // EKLENDİ: Hangi sekmede olduğumuzu ve tıklama olayını dışarıdan alıyoruz.
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomAppBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 80,
      padding: EdgeInsets.zero,
      color: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF141326).withAlpha((0.92 * 255).toInt()),
          border: Border(
            top: BorderSide(
              color: const Color.fromARGB(255, 255, 255, 255)
                  .withAlpha((0.2 * 255).toInt()),
              width: 1.0,
            ),
          ),
        ),
        child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.account_balance, 0), // Home
              _buildNavItem(Icons.receipt, 1), // Transactions

              // ORTA BUTON (Ekleme)
              // Genelde bu ayrı bir modal açar, o yüzden index mantığının dışında tutabiliriz
              // veya özel bir logic ekleyebiliriz. Şimdilik pasif bırakıyorum.
              const CustomFloatingActionButton(
                  child: Icon(Icons.add, color: Colors.white)),

              _buildNavItem(Icons.credit_card_sharp, 2), // Accounts
              _buildNavItem(Icons.settings, 3), // Settings
            ],
          ),
        ),
      ),
    );
  }

  // Kod tekrarını önlemek için küçük bir yardımcı metod
  Widget _buildNavItem(IconData icon, int index) {
    final isSelected = selectedIndex == index;
    return IconButton(
      onPressed: () => onItemTapped(index),
      icon: Icon(
        icon,
        // Seçiliyse beyaz, değilse biraz soluk yapalım
        color: isSelected ? Colors.white : Colors.white.withValues(alpha: 0.5),
        size: 28,
      ),
    );
  }
}
