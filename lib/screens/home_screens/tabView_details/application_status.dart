import 'package:flutter/material.dart';

class Application_Status extends StatefulWidget {
  // const Application_Status({super.key});

  @override
  State<Application_Status> createState() => _Application_StatusState();
}

class _Application_StatusState extends State<Application_Status> {
  final applicationData _data = applicationData();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          PaginatedDataTable(columns: const [
            DataColumn(label: Text('#')),
            DataColumn(label: Text('Description')),
            DataColumn(label: Text('Action')),
          ], source: _data)
        ],
      ),
    );
  }
}

class applicationData extends DataTableSource {
  final List<String> _applicationId = [
    "1",
    "2",
    "3",
    "4",
  ];
  final List<Map<String, dynamic>> _data = [
    {
      'applicationId': '1',
      'description': 'Change of Business\nName for tesma Auto',
      'action': 'Continue'
    },
    {
      'applicationId': '2',
      'description': "Change registered office\nfor bee's bakery",
      'action': 'Continue'
    },
    {
      'applicationId': '3',
      'description': 'Annual filling for\nTesma multimedia',
      'action': 'Continue'
    },
    {
      'applicationId': '4',
      'description': 'Inncorporation of public\nlimited by guarante',
      'action': 'Continue'
    },
  ];

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(_data[index]['applicationId'])),
      DataCell(Text(_data[index]['description'])),
      DataCell(Text(_data[index]['action'])),
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
