import 'package:rpg/models/vocation.dart';

class Skill {
  final String id;
  final String name;
  final String image;
  final Vocation vocation;

  Skill({
    required this.id,
    required this.name,
    required this.image,
    required this.vocation,
  });

  static final List<Skill> allSkills = [
    Skill(
      id: '1',
      name: 'Power Strike',
      image: 'assets/img/skills/power_strike.webp',
      vocation: Vocation.warrior,
    ),
    Skill(
      id: '2',
      name: 'Fireball',
      image: 'assets/img/skills/fireball.jpg',
      vocation: Vocation.mage,
    ),
    Skill(
      id: '3',
      name: 'Inspire',
      image: 'assets/img/skills/inspire.jpg',
      vocation: Vocation.quester,
    ),
    Skill(
      id: '4',
      name: 'Summon Undead',
      image: 'assets/img/skills/summon_undead.jpg',
      vocation: Vocation.necromancer,
    ),
    Skill(
      id: '5',
      name: 'Precise Shot',
      image: 'assets/img/skills/precise_shot.jpg',
      vocation: Vocation.archer,
    ),
    Skill(
      id: '6',
      name: 'Berserk',
      image: 'assets/img/skills/berserk.jpg',
      vocation: Vocation.warrior,
    ),
    Skill(
      id: '7',
      name: 'Ice Shard',
      image: 'assets/img/skills/ice_shard.webp',
      vocation: Vocation.mage,
    ),
    Skill(
      id: '8',
      name: 'Rally',
      image: 'assets/img/skills/rally.jpg',
      vocation: Vocation.quester,
    ),
    Skill(
      id: '9',
      name: 'Life Drain',
      image: 'assets/img/skills/life_drain.jpg',
      vocation: Vocation.necromancer,
    ),
    Skill(
      id: '10',
      name: 'Multi Shot',
      image: 'assets/img/skills/multi_shot.webp',
      vocation: Vocation.archer,
    ),
    Skill(
      id: '11',
      name: 'Shield Wall',
      image: 'assets/img/skills/shield_wall.jpg',
      vocation: Vocation.warrior,
    ),
    Skill(
      id: '12',
      name: 'Arcane Blast',
      image: 'assets/img/skills/arcane_blast.jpg',
      vocation: Vocation.mage,
    ),
    Skill(
      id: '13',
      name: 'Fortify',
      image: 'assets/img/skills/fortify.webp',
      vocation: Vocation.quester,
    ),
    Skill(
      id: '14',
      name: 'Dark Bolt',
      image: 'assets/img/skills/dark_bolt.webp',
      vocation: Vocation.necromancer,
    ),
    Skill(
      id: '15',
      name: 'Eagle Eye',
      image: 'assets/img/skills/eagle_eye.webp',
      vocation: Vocation.archer,
    ),
  ];
}
