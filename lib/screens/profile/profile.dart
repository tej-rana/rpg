import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rpg/models/character.dart';
import 'package:rpg/screens/profile/heart.dart';
import 'package:rpg/screens/profile/skill_list.dart';
import 'package:rpg/screens/profile/stats_table.dart';
import 'package:rpg/services/character_store.dart';
import 'package:rpg/shared/styled_button.dart';
import 'package:rpg/shared/styled_text.dart';
import 'package:rpg/theme.dart';

class Profile extends StatelessWidget {
  const Profile({super.key, required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StyledTitle(character.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //basic info - image, vocation, description
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(16.0),
                  color: AppColors.secondaryColor.withValues(alpha: 0.3),
                  child: Column(
                    children: [
                      SizedBox(height: 10.0),
                      Hero(
                        tag: 'character_${character.id}',
                        child: Image.asset(
                          'assets/img/vocations/${character.vocation.image}',
                          width: 140,
                          height: 140,
                        ),
                      ),
                      SizedBox(height: 12.0),
                      StyledHeading(character.vocation.title),
                      SizedBox(height: 8.0),
                      StyledText(character.vocation.description),
                    ],
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Heart(character: character),
                ),
              ],
            ),

            SizedBox(height: 20.0),
            Center(
              child: Icon(Icons.code, color: AppColors.primaryColor),
            ),
            // weapon, ability and slogan
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.0),
              color: AppColors.secondaryColor.withValues(alpha: 0.3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StyledHeading("Slogan"),
                  SizedBox(height: 8.0),
                  StyledText(character.slogan),
                  StyledHeading("Unique Ability"),
                  SizedBox(height: 8.0),
                  StyledText(character.vocation.ability),
                  StyledHeading("Weapon of Choice"),
                  SizedBox(height: 8.0),
                  StyledText(character.vocation.weapon),
                  SizedBox(height: 12.0),

                  SizedBox(height: 12.0),
                ],
              ),
            ),

            SizedBox(height: 20.0),
            Center(
              child: Icon(Icons.code, color: AppColors.primaryColor),
            ),
            // stats & skills
            Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  StatsTable(character: character),
                  SkillList(character: character),
                ],
              ),
            ),
            // save button
            StyledButton(
              onPressed: () {
                Provider.of<CharacterStore>(
                  context,
                  listen: false,
                ).saveCharacter(character);
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(
                  SnackBar(
                    content: StyledHeading('Character Updated'),
                    showCloseIcon: true,
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: StyledHeading('Save Character'),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
