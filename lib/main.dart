import 'package:chart_app/models/MahasiswaModel.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {

  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<MahasiswaModel> _dataObj;

  final _data = [
    {
      "ID_MHS": 147229,
      "NIM_MHS": "081711633017",
      "ID_SEMESTER": 226,
      "TAHUN_AJARAN": "2017/2018",
      "GROUP_SEMESTER": "Ganjil",
      "IPS_MHS": "3.33"
    },
    {
      "ID_MHS": 147229,
      "NIM_MHS": "081711633017",
      "ID_SEMESTER": 229,
      "TAHUN_AJARAN": "2017/2018",
      "GROUP_SEMESTER": "Genap",
      "IPS_MHS": "3.48"
    },
    {
      "ID_MHS": 147229,
      "NIM_MHS": "081711633017",
      "ID_SEMESTER": 234,
      "TAHUN_AJARAN": "2018/2019",
      "GROUP_SEMESTER": "Ganjil",
      "IPS_MHS": "3.45"
    },
    {
      "ID_MHS": 147229,
      "NIM_MHS": "081711633017",
      "ID_SEMESTER": 237,
      "TAHUN_AJARAN": "2018/2019",
      "GROUP_SEMESTER": "Genap",
      "IPS_MHS": "3.75"
    },
    {
      "ID_MHS": 147229,
      "NIM_MHS": "081711633017",
      "ID_SEMESTER": 240,
      "TAHUN_AJARAN": "2019/2020",
      "GROUP_SEMESTER": "Ganjil",
      "IPS_MHS": "3.8"
    },
    {
      "ID_MHS": 147229,
      "NIM_MHS": "081711633017",
      "ID_SEMESTER": 243,
      "TAHUN_AJARAN": "2019/2020",
      "GROUP_SEMESTER": "Genap",
      "IPS_MHS": "3.83"
    }
  ];

  /// Create one series with sample hard coded data.
  List<charts.Series<MahasiswaModel, int>> _createSampleData() {
    _dataObj = _data.map((e) {
      final idx = _data.indexOf(e);

      // editing object
      e['index'] = idx;

      // initialize to model
      return MahasiswaModel.fromJson(e);
    }).toList();

    return [
      new charts.Series<MahasiswaModel, int>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (MahasiswaModel single, _) => single.index,
        measureFn: (MahasiswaModel single, _) => double.parse(single.iPS_MHS),
        data: _dataObj,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        height: 300,
        child: charts.LineChart(_createSampleData(),
          animate: true,
          defaultRenderer: new charts.LineRendererConfig(includePoints: true),
          domainAxis: new charts.NumericAxisSpec(
            // viewport: new charts.NumericExtents(2017, 2021),
              tickProviderSpec: new charts.BasicNumericTickProviderSpec(
                zeroBound: false,
                dataIsInWholeNumbers: false,
                desiredTickCount: 10,
              ),
              tickFormatterSpec: charts.BasicNumericTickFormatterSpec(
                _formaterIndex,
              ),
              renderSpec: charts.GridlineRendererSpec( // 交叉轴刻度水平线
                tickLengthPx: 0,
                labelOffsetFromAxisPx: 12,
                labelRotation: 60,
              )
          ),
        ),
      ),
    );
  }

  String _formaterIndex(num idx) {
    return _dataObj[idx.toInt()].tAHUN_AJARAN;
  }
  
}
