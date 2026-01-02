import 'package:flutter/material.dart';

class DetailedTransactionCard extends StatefulWidget {
  const DetailedTransactionCard({super.key});

  @override
  State<DetailedTransactionCard> createState() =>
      _DetailedTransactionCardState();
}

class _DetailedTransactionCardState extends State<DetailedTransactionCard>
    with SingleTickerProviderStateMixin {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _expanded = !_expanded),
      child: Card(
        color: const Color.fromARGB(255, 20, 19, 38),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: AnimatedSize(
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.topCenter,
          child: IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Transaction Title',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Transaction Description — tap to expand for more details like category, merchant, and reference number.',
                                maxLines: _expanded ? null : 1,
                                overflow: _expanded
                                    ? TextOverflow.visible
                                    : TextOverflow.ellipsis,
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 202, 201, 223),
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                '01.01.2025',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 202, 201, 223),
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold),
                              ),
                              if (_expanded) ...[
                                const SizedBox(height: 12),
                                const Text(
                                  'Category: Food & Dining',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 202, 201, 223),
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                              if (!_expanded)
                                const Padding(
                                  padding: EdgeInsets.only(top: 6),
                                  child: Text('Tap to see details',
                                      style: TextStyle(
                                          color: Colors.white54, fontSize: 12)),
                                ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color.fromARGB(255, 30, 29, 57),
                                  width: 1.5),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text(
                                '\$1223.45',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13),
                              ),
                            ),
                          ),
                        ),
                        AnimatedRotation(
                          turns: _expanded ? 0.5 : 0.0,
                          duration: const Duration(milliseconds: 200),
                          child: const Icon(Icons.expand_more,
                              color: Colors.white54, size: 18),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 10,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 0, 245, 61),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(4),
                      bottomRight: Radius.circular(4),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
