enum Vocation {
  warrior(
    title: "Warrior",
    ability: "Power Strike",
    description: "A strong melee attack that deals heavy damage.",
    image: "warrior.webp",
    weapon: "Sword",
  ),
  mage(
    title: "Mage",
    ability: "Fireball",
    description: "A powerful fire-based spell that deals significant damage.",
    image: "mage.jpg",
    weapon: "Staff",
  ),
  quester(
    title: "Quester",
    ability: "Inspire",
    description:
        "Boosts the morale of allies, increasing their stats temporarily.",
    image: "quester.jpg",
    weapon: "Banner",
  ),
  necromancer(
    title: "Necromancer",
    ability: "Summon Undead",
    description: "Summons undead minions to fight for you.",
    image: "necromancer.jpg",
    weapon: "Dark Tome",
  ),
  archer(
    title: "Archer",
    ability: "Precise Shot",
    description: "A highly accurate ranged attack that deals critical damage.",
    image: "archer.webp",
    weapon: "Bow",
  );

  final String title;
  final String description;
  final String image;
  final String weapon;
  final String ability;

  const Vocation({
    required this.title,
    required this.description,
    required this.image,
    required this.weapon,
    required this.ability,
  });
}
