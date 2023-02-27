import 'package:flutter/material.dart';

class Approvals_Screen extends StatefulWidget {
  const Approvals_Screen({super.key});

  @override
  State<Approvals_Screen> createState() => _Approvals_ScreenState();
}

class _Approvals_ScreenState extends State<Approvals_Screen> {
  final approvalsData _data = approvalsData();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          PaginatedDataTable(columns: const [
            DataColumn(label: Text('#')),
            DataColumn(label: Text('Description')),
            DataColumn(label: Text('Submission Date')),
            DataColumn(label: Text('Status')),
          ], source: _data)
        ],
      ),
    );
  }
}

class approvalsData extends DataTableSource {
  final List<Map<String, dynamic>> _data = [
    {
      'applicationId': '1',
      'description': 'Change of Business\nName for tesma Auto',
      'submission': '14/06/2024',
      'status': 'Pending'
    },
    {
      'applicationId': '2',
      'description': "Change registered office\nfor bee's bakery",
      'submission': "4/08/2023",
      'status': 'Pending'
    },
    {
      'applicationId': '3',
      'description': 'Annual filling for\nTesma multimedia',
      'submission': '4/01/2025',
      'status': 'Approved'
    },
    {
      'applicationId': '4',
      'description': 'Inncorporation of public\nlimited by guarante',
      'submission': '01/02/2023',
      'status': 'Approved'
    },
  ];
  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(_data[index]['applicationId'])),
      DataCell(Text(_data[index]['description'])),
      DataCell(Text(_data[index]['submission'])),
      DataCell(Text(_data[index]['status'])),
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
