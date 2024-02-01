import 'package:bimo_app/features/pengumuman/pemumuman_list/model/records_model.dart';
import 'package:bimo_app/global_widget/global_app_bar.dart';
import 'package:bimo_app/utils/color_utils.dart';
import 'package:bimo_app/utils/text_theme_utils.dart';
import 'package:flutter/material.dart';

class PengumumanDetailPage extends StatefulWidget {
  const PengumumanDetailPage({
    super.key,
    required this.recordsModel,
  });
  final RecordsModel recordsModel;

  @override
  State<PengumumanDetailPage> createState() => _PengumumanDetailPageState();
}

class _PengumumanDetailPageState extends State<PengumumanDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: GlobalAppBar1(
            context: context,
            title: "Pengumuman",
            canPop: true,
          ),
          body: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  widget.recordsModel.imgBackgroud,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width / 5 * 3,
                  fit: BoxFit.fitWidth,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        widget.recordsModel.judul,
                        style: CustomTextTheme.subtitle2.copyWith(color: CustomColors.blueDefault),
                      ),
                      const SizedBox(height: 18),
                      Text(
                        "${widget.recordsModel.tgl}  •  ${widget.recordsModel.jam}  •  ${widget.recordsModel.penulis}",
                        style: CustomTextTheme.overline.copyWith(color: CustomColors.blackTeritiary),
                      ),
                      const SizedBox(height: 25),
                      Text(
                        widget.recordsModel.konten,
                        style: CustomTextTheme.caption.copyWith(color: CustomColors.blackSecondary),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
