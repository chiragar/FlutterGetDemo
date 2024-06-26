import 'package:flutter/material.dart';
import 'package:flutterlivedemo/src/core/assets.dart';
import 'package:flutterlivedemo/src/data/model/user_model.dart';

class FilterScreen extends StatefulWidget {
  final startDate;
  final endDate;

  const FilterScreen(
      {super.key, required this.startDate, required this.endDate});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  List<UserModel> datas=[];
  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    datas= userList.where((filters) {
      final hireDate = DateTime.parse(filters.hireDt!.split('-').reversed.join('-'));
      return hireDate
              .isAfter(DateTime.parse(widget.startDate.toString())) &&
          hireDate.isBefore(DateTime.parse(widget.endDate.toString()));
    }).toList();
;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text("Filter List")),
        body: datas.length == 0
            ? Center(
                child: Text("No Data Found"),
              )
            : ListView.builder(
                itemCount: datas.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var data = datas[index];
                  return Card(
                    elevation: 1,
                    margin: EdgeInsets.all(4),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Image.asset(
                            CustomAssets.gallery,
                            width: size.width * 0.15,
                            height: size.width * 0.15,
                          ),
                          SizedBox(width: size.width * 0.02),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Name ${data.name ?? ""}",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: size.height * 0.005),
                              Text("Email  ${data.email ?? ""}"),
                              SizedBox(height: size.height * 0.005),
                              Text("Hire Dt  ${data.hireDt ?? ""}"),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ));
  }
}
