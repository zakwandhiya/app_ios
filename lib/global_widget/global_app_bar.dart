import 'package:bimo_app/utils/color_utils.dart';
import 'package:bimo_app/utils/text_theme_utils.dart';
import 'package:flutter/material.dart';

class GlobalAppBarActionsButton extends Container {
  GlobalAppBarActionsButton({
    super.key,
    required IconData iconData,
    required void Function()? onPressed,
  }) : super(
          child: IconButton(
            icon: Icon(
              iconData,
              color: CustomColors.blackMamba,
              size: 24,
            ),
            onPressed: onPressed,
          ),
          height: 42,
          width: 42,
        );
}

// ======= Example =======
// appBar: GlobalAppBar2(
//         context: context,
//         title: "Biodata Mahasiswa",
//         subtitle: "Form PA-00",
//         canPop: true,
//         actions: [
//           GlobalAppBarActionsButton(
//             iconData: Icons.search,
//             onPressed: () {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 const SnackBar(content: Text('snackbar from search')),
//               );
//             },
//           ),
//           GlobalAppBarActionsButton(
//             iconData: Icons.more_vert,
//             onPressed: () {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 const SnackBar(content: Text('snackbar from menu')),
//               );
//             },
//           ),
//         ],
//       ),

class GlobalAppBar2 extends PreferredSize {
  GlobalAppBar2({
    Key? key,
    required BuildContext context,
    bool canPop = false,
    required String title,
    required String subtitle,
    List<Widget>? actions,
  }) : super(
          key: key,
          preferredSize: const Size.fromHeight(50),
          child: Column(
            children: [
              // const SizedBox(height: 34),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  canPop
                      ? SizedBox(
                          height: 42,
                          width: 56,
                          child: IconButton(
                            icon: const Icon(
                              Icons.west,
                              color: Colors.black,
                              size: 24,
                            ),
                            tooltip: 'pop',
                            padding: const EdgeInsets.all(0),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        )
                      : const SizedBox(width: 17),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        Text(
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextTheme.heading6.copyWith(color: CustomColors.blackMamba),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          subtitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextTheme.overline.copyWith(color: CustomColors.blackSecondary),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      const SizedBox(height: 3),
                      actions != null
                          ? Row(
                              // children: actions,
                              children: actions
                                  .map<Widget>(
                                    (button) => SizedBox(
                                      height: 42,
                                      child: button,
                                      // width: 42,
                                    ),
                                  )
                                  .toList(),
                            )
                          : const SizedBox(width: 6),
                    ],
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ],
          ),
        );
}

class GlobalAppBar2WithTabVie extends PreferredSize {
  GlobalAppBar2WithTabVie({
    Key? key,
    required BuildContext context,
    bool canPop = false,
    required String title,
    required String subtitle,
    List<Widget>? actions,
  }) : super(
          key: key,
          preferredSize: const Size.fromHeight(50),
          child: Column(
            children: [
              // const SizedBox(height: 34),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  canPop
                      ? SizedBox(
                          height: 42,
                          width: 56,
                          child: IconButton(
                            icon: const Icon(
                              Icons.west,
                              color: Colors.black,
                              size: 24,
                            ),
                            tooltip: 'pop',
                            padding: const EdgeInsets.all(0),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        )
                      : const SizedBox(width: 17),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        Text(
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextTheme.heading6.copyWith(color: CustomColors.blackMamba),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          subtitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextTheme.overline.copyWith(color: CustomColors.blackSecondary),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      const SizedBox(height: 3),
                      actions != null
                          ? Row(
                              // children: actions,
                              children: actions
                                  .map<Widget>(
                                    (button) => SizedBox(
                                      height: 42,
                                      child: button,
                                      // width: 42,
                                    ),
                                  )
                                  .toList(),
                            )
                          : const SizedBox(width: 6),
                    ],
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ],
          ),
        );
}

// ======= Example =======
// appBar: GlobalAppBar1(
//         context: context,
//         title: "Profil",
//         canPop: false,
//         actions: [
//           GlobalAppBarActionsButton(
//             iconData: Icons.search,
//             onPressed: () {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 const SnackBar(content: Text('snackbar from search')),
//               );
//             },
//           ),
//           GlobalAppBarActionsButton(
//             iconData: Icons.more_vert,
//             onPressed: () {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 const SnackBar(content: Text('menu')),
//               );
//             },
//           ),
//         ],
//       ),

class GlobalAppBar1 extends PreferredSize {
  GlobalAppBar1({
    Key? key,
    required BuildContext context,
    bool canPop = false,
    required String title,
    List<Widget>? actions,
  }) : super(
          key: key,
          preferredSize: const Size.fromHeight(50),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  canPop
                      ? SizedBox(
                          height: 42,
                          width: 56,
                          child: IconButton(
                            icon: const Icon(
                              Icons.west,
                              color: Colors.black,
                              size: 24,
                            ),
                            tooltip: 'pop',
                            padding: const EdgeInsets.all(0),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        )
                      : const SizedBox(width: 17),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        Text(
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextTheme.heading6.copyWith(color: CustomColors.blackMamba),
                        ),
                      ],
                    ),
                  ),
                  actions != null
                      ? Row(
                          // children: actions,
                          children: actions
                              .map<Widget>(
                                (button) => SizedBox(
                                  height: 42,
                                  width: 42,
                                  child: button,
                                ),
                              )
                              .toList(),
                        )
                      : const SizedBox(width: 6),
                  const SizedBox(width: 10),
                ],
              ),
            ],
          ),
        );
}
