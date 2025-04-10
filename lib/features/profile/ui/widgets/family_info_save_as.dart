import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrmatrix/core/helper/spacing.dart';

class FamilyInfoSaveAs extends StatelessWidget {
  const FamilyInfoSaveAs({super.key});

  void _showSaveOptions(BuildContext context) async {
    final RenderBox button = context.findRenderObject() as RenderBox;
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;
    final position = button.localToGlobal(
      Offset(button.size.width, button.size.height),
      ancestor: overlay,
    );

    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        position.dx,
        position.dy,
        position.dx + button.size.width,
        position.dy + button.size.height,
      ),
      items: [
        _buildMenuItem(
          context,
          icon: Icons.picture_as_pdf,
          label: 'PDF',
          color: Colors.red,
          onTap: () => _handleFormatSelection(context, 'PDF'),
        ),
        _buildMenuItem(
          context,
          icon: Icons.grid_on,
          label: 'Excel',
          color: Colors.green,
          onTap: () => _handleFormatSelection(context, 'Excel'),
        ),
      ],
    );
  }

  PopupMenuItem _buildMenuItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return PopupMenuItem(
      height: 40,
      onTap: onTap,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: 12),
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
    );
  }

  void _handleFormatSelection(BuildContext context, String format) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Downloading as $format...'),
        backgroundColor: Colors.blueGrey[800],
        behavior: SnackBarBehavior.floating,
      ),
    );
    // Add your actual download logic here
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showSaveOptions(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.blueGrey[50],
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Colors.blueGrey.withValues(alpha: 0.2)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.download_rounded, color: Colors.blueGrey[700], size: 22),
            horizontalSpace(8),
            Text(
              'Save as',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.blueGrey[800],
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 4),
            Icon(
              Icons.arrow_drop_down_rounded,
              color: Colors.blueGrey[500],
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
