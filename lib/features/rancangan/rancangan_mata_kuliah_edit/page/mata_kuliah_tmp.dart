import 'package:dropdown_search/dropdown_search.dart';
import 'package:inventory_clone/utils/network_utils.dart';
import 'package:inventory_clone/utils/shared_value.dart';

import '../bloc/location_bloc.dart';
import '../model/location_model.dart';
import '../bloc/location_state.dart';
import 'package:inventory_clone/injection_container.dart';
import 'package:flutter/material.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;

class LocationPage extends StatefulWidget {
  final Function(LocationModel) onChanged;
  final LocationModel initialLocation;
  final bool enable;
  String tittle;

  LocationPage({
    Key key,
    @required this.onChanged,
    @required this.initialLocation,
    this.tittle = "Lokasi",
    this.enable = true,
  }) : super(key: key);

  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  // LocationBloc locationBloc = sl<LocationBloc>();

  LocationModel locationModel;
  @override
  void initState() {
    // TODO: implement initState
    locationModel = globalLocationModel();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<List<LocationModel>> getData(filter) async {
    var headers = {
      'x-sm-key': '35d3d08c3d7b7f445ceb8e726a87b26c',
      'Authorization': 'Basic c200cnRzMGZ0Oj96d01BeEJuUzlqag==',
      'Cookie': 'ci_session=73facbbb05b78ded631fdb3bce0b04e49ddac0eb'
    };
    var request = http.MultipartRequest('POST', Uri.parse(NetworkUtils.baseUrl() + '/lokasi'));
    request.fields.addAll({'id': '', 'keyword': filter, 'id_user': '1'});

    request.headers.addAll(headers);

    http.StreamedResponse response;
    try {
      response = await request.send();
    } catch (e) {
      return [];
    }

    String body = await response.stream.bytesToString();

    var locationList = json.decode(body)["data"] as List;
    List<LocationModel> locationTmp = locationList.map((i) => LocationModel.fromJson(i)).toList();

    if (locationList != null) {
      return locationTmp;
    }

    return [];
  }

  Widget _customDropDownExample(BuildContext context, LocationModel item, String itemDesignation) {
    if (item == null) {
      return Container();
    }

    return Text(
      item.option,
      maxLines: 1,
    );
  }

  Widget _customPopupItemBuilderExample(BuildContext context, LocationModel item, bool isSelected) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: !isSelected
          ? null
          : BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
      child: ListTile(
        selected: isSelected,
        title: Text(item.option),
      ),
    );
  }

  void setSelectedLocation(LocationModel data) {
    SharedValue.setLokasiId(data.id);
    SharedValue.setLokasiValue(data.value);
    SharedValue.setLokasiOption(data.option);
    widget.onChanged(data);
  }

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<LocationModel>(
      searchFieldProps: TextFieldProps(
        controller: TextEditingController(text: ''),
      ),
      mode: Mode.BOTTOM_SHEET,
      maxHeight: 700,
      enabled: widget.enable,
      isFilteredOnline: true,
      showSearchBox: true,
      label: widget.tittle,
      validator: (value) {
        if (value == null) {
          return 'value kosong';
        }
        return null;
      },
      autoValidateMode: AutovalidateMode.onUserInteraction,
      selectedItem: widget.initialLocation,
      dropdownSearchDecoration: InputDecoration(
        isDense: false,
        fillColor: widget.enable ? Colors.white10 : Colors.grey[200],
        filled: true,
        errorStyle: TextStyle(
          fontSize: 0,
          height: 0,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 1.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
        ),
      ),
      emptyBuilder: (dropdowncontext, text) {
        print(text);
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
            ),
            Text(
              "Data Tidak ditemukan",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        );
      },
      errorBuilder: (context, text, tmp) {
        print(text);
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
            ),
            Text(
              "Internal Server Error",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        );
      },
      onFind: (String filter) => getData(filter),
      onChanged: setSelectedLocation,
      dropdownBuilder: _customDropDownExample,
      dropdownBuilderSupportsNullItem: true,
      // popupItemBuilder: _customPopupItemBuilderExample,
      popupSafeArea: PopupSafeArea(top: true, bottom: true),
      scrollbarProps: ScrollbarProps(
        isAlwaysShown: true,
        thickness: 7,
      ),
    );
  }
}
