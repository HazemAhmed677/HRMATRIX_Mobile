import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrmatrix/core/theming/app_color.dart';
import 'package:hrmatrix/core/widgets/custom_logout_button.dart';

import '../../../features/auth/ui/helper/show_dialog_helper.dart';
import '../../../features/auth/ui/widgets/sign_out_alert.dart';

class CustomPopUpMenu extends StatelessWidget {
  const CustomPopUpMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      position: PopupMenuPosition.under,
      color: AppColors.emptyCircleProgressColor,
      icon: Icon(Icons.more_vert, color: AppColors.fontPrimaryColor),
      itemBuilder:
          (context) => [
            const PopupMenuItem<String>(
              value: 'profile',
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text('Profile'),
              ),
            ),
            const PopupMenuItem<String>(
              value: 'notifications',
              child: ListTile(
                leading: Icon(Icons.notifications),
                title: Text('Notifications'),
              ),
            ),
            const PopupMenuItem<String>(
              value: 'theme',
              child: ListTile(
                leading: Icon(Icons.brightness_4),
                title: Text('Change Theme'),
              ),
            ),
            const PopupMenuDivider(height: 10),
            PopupMenuItem<String>(
              padding: EdgeInsets.zero,
              value: 'logout',
              child: Align(
                alignment: Alignment.center,
                child: CustomActionButton(
                  onPressed: () {
                    // Handle logout logic here
                    logoutDialogHelper(
                      context: context,
                      child: const SignOutAlert(),
                    );
                  },
                  text: 'Logout',
                  edgeColor: AppColors.blue,
                  backgroundColor: AppColors.blue,
                  textColor: AppColors.white,
                  overlayColor: AppColors.white,
                  size: Size(150.w, 40),
                  fontSize:
                      MediaQuery.of(context).orientation ==
                              Orientation.landscape
                          ? 8
                          : 14,
                ),
              ),
            ),
          ],
      onSelected: (value) {
        if (value == 'logout') {
          // Additional logout logic if needed
        }
      },
    );
  }
}
