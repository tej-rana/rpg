import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rpg/models/skill.dart';
import 'package:rpg/models/stats.dart';
import 'package:rpg/models/vocation.dart';

class Character with Stats {
  final String name;
  final String slogan;
  final String id;
  final Vocation vocation;
  final Set<Skill> skills = {};
  bool _isFav = false;

  Character({
    required this.name,
    required this.slogan,
    required this.id,
    required this.vocation,
  });

  bool get isFav => _isFav;

  void toggleIsFav() {
    _isFav = !_isFav;
  }

  void updateSkill(Skill skill) {
    skills.clear();
    skills.add(skill);
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'slogan': slogan,
      'isFav': _isFav,
      'vocation': vocation
          .toString(), // --> vocation.Archer or vocation.Warrior
      'skills': skills.map((s) => s.id).toList(), // [123, 124, 125]
      'stats': statsAsMap, // {'health': 12, 'attack': 8, 'defense': 10}
      'points': points,
    };
  }

  factory Character.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();

    Character character = Character(
      name: data!['name'] ?? '',
      slogan: data['slogan'] ?? '',
      id: snapshot.id,
      vocation: Vocation.values.firstWhere(
        (v) => v.toString() == data['vocation'],
      ),
    );

    for (String id in data['skills']) {
      Skill skill = Skill.allSkills.firstWhere((x) => x.id == id);
      character.updateSkill(skill);
    }
    character._isFav = data['isFav'];
    character.setStats(points: data['points'], stats: data['stats']);
    return character;
  }
}
