import 'package:flutter/material.dart';

class Payment_Screen extends StatefulWidget {
  const Payment_Screen({super.key});

  @override
  State<Payment_Screen> createState() => _Payment_ScreenState();
}

class _Payment_ScreenState extends State<Payment_Screen> {
  final paymentData _data = paymentData();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          PaginatedDataTable(columns: const [
            DataColumn(label: Text('#')),
            DataColumn(label: Text('Description')),
            DataColumn(label: Text('Date')),
          ], source: _data)
        ],
      ),
    );
  }
}

class paymentData extends DataTableSource {
  final List<Map<String, dynamic>> _data = [
    {
      'applicationId': '1',
      'description': 'Change of Business\nName for tesma Auto',
      'date': '01/02/2023',
    },
    {
      'applicationId': '2',
      'description': "Change registered office\nfor bee's bakery",
      'date': '01/07/2023',
    },
    {
      'applicationId': '3',
      'description': 'Annual filling for\nTesma multimedia',
      'date': '01/09/2025',
    },
    {
      'applicationId': '4',
      'description': 'Inncorporation of public\nlimited by guarante',
      'date': '01/02/2025',
    },
  ];
  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(_data[index]['applicationId'])),
      DataCell(Text(_data[index]['description'])),
      DataCell(Text(_data[index]['date'])),
    ]);
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => _data.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
