import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rmpl_hrm/constants/colors.dart';
import 'package:rmpl_hrm/extensions/widget/box.dart';
import 'package:rmpl_hrm/state/navigation/models/navigation_screen.dart';
import 'package:rmpl_hrm/state/navigation/providers/navigation.dart';

class MenuItem extends ConsumerWidget {
  const MenuItem({
    super.key,
    required this.screen,
    required this.selected,
  });

  final Screen screen;
  final bool selected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.only(
        left: 12,
        right: 12,
        top: 8,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: selected ? primaryColor.withOpacity(0.3) : Colors.transparent,
      ),
      child: InkWell(
        onTap: () {
          ref.read(navigationProvider.notifier).onChange(screen);
          Navigator.of(context).pop();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 12,
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/icons/Home.svg',
                colorFilter: const ColorFilter.mode(
                  darkColor,
                  BlendMode.srcIn,
                ),
              ),
              12.widthBox,
              Expanded(
                child: Text(
                  screen.title,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
