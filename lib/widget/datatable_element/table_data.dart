import 'package:flutter/material.dart';
import 'package:wasa/config/utils/constant.dart';

import '../../config/theme/theme.dart';

DataTable createDataTable(String firstDataColumnText,
    String SecondDataColumnText, List<Map> dataList) {
  return DataTable(
    columns: _createColumns(firstDataColumnText, SecondDataColumnText),
    rows: _createRows(dataList),
    dividerThickness: kBorderValue1_5,
    dataRowHeight: 50,
    showBottomBorder: true,
    headingTextStyle:
        TextStyle(fontWeight: FontWeight.bold, color: AppStyle.kGreyColor),
    headingRowColor:
        MaterialStateProperty.resolveWith((states) => AppStyle.kgreyToWhite),
    border: TableBorder.all(
      width: 0.3,
      color: AppStyle.kBlack,
    ),
  );
}

List<DataColumn> _createColumns(
    String firstDataColumnText, String SecondDataColumnText) {
  return [
    DataColumn(
      label: Text('#'),
    ),
    DataColumn(label: Text(firstDataColumnText)),
    DataColumn(label: Text(SecondDataColumnText))
  ];
}

List<DataRow> _createRows(List<Map> dataList) {
  return dataList.map((data) {
    return DataRow(cells: [
      DataCell(Text(data['id'].toString())),
      DataCell(
        Text(
          data['firstrow'],
          style: TextStyle(color: AppStyle.kGreyColor),
        ),
      ),
      DataCell(
        Text(
          data['secondrow'],
          style: TextStyle(color: AppStyle.kGreyColor),
        ),
      )
    ]);
  }).toList();
}
