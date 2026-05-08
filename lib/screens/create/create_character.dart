import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rpg/models/character.dart';
import 'package:rpg/models/vocation.dart';
import 'package:rpg/screens/create/vocation_card.dart';
import 'package:rpg/screens/home/home.dart';
import 'package:rpg/services/character_store.dart';
import 'package:rpg/shared/styled_button.dart';
import 'package:rpg/shared/styled_text.dart';
import 'package:rpg/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class CreateCharacter extends StatefulWidget {
  const CreateCharacter({super.key});

  @override
  State<CreateCharacter> createState() => _CreateCharacterState();
}

class _CreateCharacterState extends State<CreateCharacter> {
  final _nameController = TextEditingController();
  final _sloganController = TextEditingController();
  Vocation _selectedVocation = Vocation.warrior;

  @override
  void dispose() {
    _nameController.dispose();
    _sloganController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    final name = _nameController.text.trim();
    final slogan = _sloganController.text.trim();

    if (name.isEmpty || slogan.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: StyledHeading('Invalid Input'),
            content: StyledText('Please enter both name and slogan.'),
            actions: [
              StyledButton(
                onPressed: () => Navigator.pop(context),
                child: StyledHeading('Close'),
              ),
            ],
            actionsAlignment: MainAxisAlignment.center,
          );
        },
      );
      /*ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter both name and slogan')),
      );*/
      return;
    }

    Provider.of<CharacterStore>(context, listen: false).addCharacter(
      Character(
        id: uuid.v4(),
        name: name,
        slogan: slogan,
        vocation: _selectedVocation,
      ),
    );

    Navigator.push(context, MaterialPageRoute(builder: (ctx) => const Home()));
  }

  void _handleVocationSelect(Vocation vocation) {
    setState(() {
      _selectedVocation = vocation;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledTitle('Character Creation'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Icon(
                  Icons.code,
                  color: AppColors.primaryColor,
                ),
              ),
              Center(child: StyledHeading('Welcome, new player')),
              Center(
                child: StyledText('Create a name & slogan for your character'),
              ),
              SizedBox(height: 30.0),
              TextField(
                controller: _nameController,
                style: GoogleFonts.kanit(
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                ),
                cursorColor: AppColors.textColor,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person_2),
                  label: StyledText('Character Name'),
                ),
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: _sloganController,
                style: GoogleFonts.kanit(
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                ),
                cursorColor: AppColors.textColor,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.chat),
                  label: StyledText('Slogan'),
                ),
              ),
              SizedBox(height: 30.0),
              //select vocation title
              Center(
                child: Icon(
                  Icons.code,
                  color: AppColors.primaryColor,
                ),
              ),
              Center(child: StyledHeading('Select Your Vocation')),
              Center(
                child: StyledText(
                  'This determines your starting stats and abilities.',
                ),
              ),
              const SizedBox(height: 30.0),
              //vocation cards
              VocationCard(
                selected: _selectedVocation == Vocation.necromancer,
                onTap: _handleVocationSelect,
                vocation: Vocation.necromancer,
              ),
              VocationCard(
                selected: _selectedVocation == Vocation.quester,
                onTap: _handleVocationSelect,
                vocation: Vocation.quester,
              ),
              VocationCard(
                selected: _selectedVocation == Vocation.archer,
                onTap: _handleVocationSelect,
                vocation: Vocation.archer,
              ),
              VocationCard(
                selected: _selectedVocation == Vocation.mage,
                onTap: _handleVocationSelect,
                vocation: Vocation.mage,
              ),
              VocationCard(
                selected: _selectedVocation == Vocation.warrior,
                onTap: _handleVocationSelect,
                vocation: Vocation.warrior,
              ),

              Center(
                child: Icon(
                  Icons.code,
                  color: AppColors.primaryColor,
                ),
              ),
              Center(child: StyledHeading('Good luck on your adventure!')),
              Center(
                child: StyledText(
                  'Enjoy the journey!',
                ),
              ),
              const SizedBox(height: 30.0),

              Center(
                child: StyledButton(
                  onPressed: _handleSubmit,
                  child: StyledHeading('Create Character'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
