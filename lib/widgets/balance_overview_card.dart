import 'package:flutter/material.dart';

class BalanceOverviewCard extends StatelessWidget {
  const BalanceOverviewCard({super.key, required this.balance});
  final double balance;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.7),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Current Balance',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.arrow_upward, size: 14, color: Colors.green),
                      SizedBox(width: 4),
                      Text(
                        '2.5%',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              '\$400.00',
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

// Widget _buildBalanceDetail(
//   BuildContext context,
//   IconData icon,
//   String label,
//   String amount,
// ) {
//   return Row(
//     children: [
//       Container(
//         padding: const EdgeInsets.all(8),
//         decoration: BoxDecoration(
//           color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: Icon(
//           icon,
//           color: Theme.of(context).colorScheme.primary,
//           size: 20,
//         ),
//       ),
//       const SizedBox(width: 8),
//       Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             label,
//             style: const TextStyle(
//               fontSize: 12,
//               color: Color.fromARGB(255, 55, 54, 54),
//             ),
//           ),
//           Text(amount, style: const TextStyle(fontWeight: FontWeight.bold)),
//         ],
//       ),
//     ],
//   );
// }
