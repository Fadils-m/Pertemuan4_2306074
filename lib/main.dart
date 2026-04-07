import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp(name: 'Teknik Informatika', year: 2026)));
}

class MyApp extends StatelessWidget {
  final String name;
  final int year;

  MyApp({required this.name, required this.year});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 166, 105, 240),
        title: const Text('Pertemuan 4'),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: NumberSceen(),
      ),
    );
  }
}

class NumberSceen extends StatefulWidget {
  @override
  _NumberSceenState createState() => _NumberSceenState();
}

class _NumberSceenState extends State<NumberSceen> {
  String name = 'Produk 1';
  String photo = 'https://picsum.photos/200/300';
  int qty = 0;
  int price = 15000;

  // Format Rupiah
  String formatRupiah(int angka) {
    return 'Rp ${angka.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}';
  }

  // Hitung total harga
  int get totalPrice => price * qty;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Gambar Produk 
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      photo,
                      height: 120,
                      width: 120,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => 
                        Container(
                          width: 120,
                          height: 120,
                          color: Colors.grey[300],
                          child: const Icon(Icons.image, size: 50),
                        ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  
                  // Informasi Produk
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Nama Produk
                        Text(
                          name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 4),
                        
                        // Harga Satuan
                        Text(
                          formatRupiah(price),
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 12),
                        
                        
                        Row(
                          children: [
                            // Tombol Kurang
                            IconButton(
                              icon: const Icon(Icons.remove_circle_outline, size: 28),
                              onPressed: qty > 0
                                  ? () {
                                      setState(() {
                                        qty--;
                                      });
                                    }
                                  : null,
                              color: qty > 0 ? Colors.red : Colors.grey,
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                            ),
                            
                            // Quantity
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.purple, width: 2),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                qty.toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.purple,
                                ),
                              ),
                            ),
                            
                            // Tombol Tambah
                            IconButton(
                              icon: const Icon(Icons.add_circle_outline, size: 28),
                              onPressed: () {
                                setState(() {
                                  qty++;
                                });
                              },
                              color: Colors.green,
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        
                        // Total Harga
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.purple[50],
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.purple, width: 1),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                'Total: ',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                formatRupiah(totalPrice),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.purple[700],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}