import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrmatrix/layout/main_layout/widgets/common_login_as_icon.dart';

import '../../../core/theming/app_color.dart';
import '../../../core/widgets/custom_logout_button.dart';

class CustomPopUpMenu extends StatelessWidget {
  const CustomPopUpMenu({super.key});

  void _showRoleMenu(BuildContext context, Offset position) {
    showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(position.dx, position.dy, 0, 0),
      color: AppColors.emptyCircleProgressColor,
      items: [
        const PopupMenuItem<String>(
          value: 'Member',
          child: CommonLoginAsIcon(title: 'Member'),
        ),
        const PopupMenuItem<String>(
          value: 'Direct Manager',
          child: CommonLoginAsIcon(title: 'Direct Manager'),
        ),
        const PopupMenuItem<String>(
          value: 'HOD',
          child: CommonLoginAsIcon(title: 'HOD'),
        ),
        const PopupMenuItem<String>(
          value: 'SP',
          child: CommonLoginAsIcon(title: 'SP'),
        ),
        const PopupMenuItem<String>(
          value: 'HR Supervisor',
          child: CommonLoginAsIcon(title: 'HR Supervisor'),
        ),
        const PopupMenuItem<String>(
          value: 'Accountant',
          child: CommonLoginAsIcon(title: 'Accountant'),
        ),
      ],
    ).then((selectedRole) {
      if (selectedRole != null) {
        // Handle role selection
      }
    });
  }

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
            PopupMenuItem<String>(
              value: 'login',
              onTap: () async {
                await Future.delayed(
                  Duration.zero,
                ); // Ensure this runs *after* the popup closes
                final RenderBox overlay =
                    Overlay.of(context).context.findRenderObject() as RenderBox;
                final Offset position = overlay.localToGlobal(Offset.zero);
                _showRoleMenu(context, position + Offset(100, 100));
              },
              child: ListTile(
                leading: Icon(Icons.login),
                title: Text('Login As'),
                trailing: Icon(Icons.arrow_right),
              ),
            ),
            const PopupMenuDivider(height: 10),
            PopupMenuItem<String>(
              padding: EdgeInsets.zero,
              value: 'trigger',
              child: Align(
                alignment: Alignment.center,
                child: CustomActionButton(
                  onPressed: () {},
                  text: 'Trigger',
                  edgeColor: AppColors.blue,
                  backgroundColor: AppColors.blue,
                  textColor: AppColors.white,
                  overlayColor: AppColors.white,
                  size: Size(150.w, 40),
                ),
              ),
            ),
          ],
      onSelected: (value) {
        if (value == 'trigger') {
          // Handle trigger logic
        }
        // Other top-level logic
      },
    );
  }
}
