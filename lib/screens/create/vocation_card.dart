import 'package:flutter/material.dart';
import 'package:rpg/models/vocation.dart';
import 'package:rpg/shared/styled_text.dart';
import 'package:rpg/theme.dart';

class VocationCard extends StatelessWidget {
  final Vocation vocation;
  final void Function(Vocation vocation) onTap;
  final bool selected;

  const VocationCard({
    super.key,
    required this.vocation,
    required this.onTap,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(vocation);
      },
      child: Card(
        color: selected ? AppColors.primaryAccent : Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Image.asset(
                'assets/img/vocations/${vocation.image}',
                width: 80,
                color: !selected
                    ? Colors.black.withValues(alpha: 0.8)
                    : Colors.transparent,
                colorBlendMode: BlendMode.color,
              ),
              const SizedBox(width: 10.0),
              //rest of the column space
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StyledHeading(
                      vocation.title,
                    ),
                    StyledText(
                      vocation.description,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
