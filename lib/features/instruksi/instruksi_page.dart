import 'package:bimo_app/features/portofolio/model/portofolio_item_model.dart';
import 'package:bimo_app/features/rancangan/mata_kuliah_model/records_model.dart';
import 'package:bimo_app/features/portofolio/portofolio_edit/bloc/portofolio_edit_bloc.dart';
import 'package:bimo_app/features/portofolio/portofolio_edit/bloc/portofolio_edit_state.dart';
import 'package:bimo_app/global_widget/global_app_bar.dart';
import 'package:bimo_app/global_widget/global_dialog.dart';
import 'package:bimo_app/global_widget/input_decoration.dart';
import 'package:bimo_app/injection_container.dart';
import 'package:bimo_app/utils/color_utils.dart';
import 'package:bimo_app/utils/text_theme_utils.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/scheduler.dart';

import 'package:flutter/material.dart';

class InstruksiPage extends StatefulWidget {
  const InstruksiPage({
    super.key,
  });

  @override
  _InstruksiPageState createState() => _InstruksiPageState();
}

class _InstruksiPageState extends State<InstruksiPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<InstruksiItem> item = [
    InstruksiItem(title: "Menerima info dosen PA", content: "Menerima informasi nama dan kontak dosen Pembimbing Akademik (PA)"),
    InstruksiItem(
        title: "Mengisi kelengkapan berkas",
        content:
            "Melengkapi/mengisi kelengkapan berkas bimbingan akademik pada seperti:\n a. Biodata Mahasiswa\n b. Target Milestone Perkuliahan\n c. Rancangan Perkuliahan\n d. Portofolio Mahasiswa"),
    InstruksiItem(title: "Mengontak dosen PA", content: "Mengontak dosen PA melalui fitur chat untuk memastikan jadwal bimbingan dan konsultasi"),
    InstruksiItem(
        title: "Konsultasi dengan dosen PA",
        content:
            "Dapat melakukan konsultasi sesuai jadwal kesepakatan tentang rencana perkuliahan, problem akademik, atau diskusi lain terkait penyelesaian studi"),
    InstruksiItem(
        title: "Mengisi logbook bimbingan",
        content: "Setelah bimbingan PA berakhir, diharapkan mengisi form Logbook Bimbingan Akademik (PA-05) pada menu profil"),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _showSnackbar(String value) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(value),
        duration: const Duration(seconds: 1),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
          appBar: GlobalAppBar1(
            context: context,
            title: "Instruksi Bimbingan",
            canPop: true,
          ),
          body: ListView.builder(
            itemCount: 5,
            padding: EdgeInsets.all(16),
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: ExpansionTile(
                  title: Text(
                    item[index].title,
                    style: CustomTextTheme.subtitle2.copyWith(color: CustomColors.blackMamba),
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        item[index].content,
                        style: CustomTextTheme.caption.copyWith(color: CustomColors.blackSecondary),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class InstruksiItem {
  String title;
  String content;

  InstruksiItem({required this.title, required this.content});
}
