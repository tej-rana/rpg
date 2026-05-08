import 'package:flutter/material.dart';
import 'package:rpg/models/character.dart';
import 'package:rpg/models/skill.dart';
import 'package:rpg/shared/styled_text.dart';
import 'package:rpg/theme.dart';

class SkillList extends StatefulWidget {
  const SkillList({super.key, required this.character});

  final Character character;

  @override
  State<SkillList> createState() => _SkillListState();
}

class _SkillListState extends State<SkillList> {
  late Skill selectedSkill;

  List<Skill> get availableSkills {
    return Skill.allSkills
        .where((skill) => skill.vocation == widget.character.vocation)
        .toList();
  }

  @override
  void initState() {
    super.initState();
    selectedSkill = widget.character.skills.isNotEmpty
        ? widget.character.skills.first
        : availableSkills.first;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Container(
        padding: EdgeInsets.all(16),
        color: AppColors.secondaryColor.withValues(alpha: 0.5),
        child: Column(
          children: [
            StyledHeading(
              "Choose an active skill",
            ),
            StyledText(
              "Active skills are powerful abilities that can be used in combat. You can only have one active skill equipped at a time.",
            ),
            SizedBox(height: 20.0),

            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: availableSkills.map((skill) {
                return ListTile(
                  onTap: () => setState(() {
                    widget.character.updateSkill(skill);
                    selectedSkill = skill;
                  }),

                  selected: selectedSkill == skill,
                  leading: Image.asset(
                    skill.image,
                    width: 80,

                    fit: BoxFit.cover,
                    colorBlendMode: BlendMode.clear,
                  ),
                  minLeadingWidth: 100,
                  tileColor: Colors.transparent,
                  titleAlignment: ListTileTitleAlignment.top,
                  selectedTileColor: AppColors.highlightColor.withValues(
                    alpha: 0.3,
                  ),
                  title: StyledText(skill.name),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
