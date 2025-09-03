import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rm_api_app/models/character.dart';
import 'package:rm_api_app/viewmodel/character_list_viewmodel.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CharacterListViewmodel>().fetchCharacters();
    });
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<CharacterListViewmodel>();

    if (vm.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (vm.error != null) {
      return Center(child: Text('Erro: ${vm.error}'));
    }

    if (vm.characters.isEmpty) {
      return const Center(child: Text('Nenhum personagem encontrado'));
    }

    return ListView.builder(
      itemCount: vm.characters.length,
      itemBuilder: (context, index) {
        Character character = vm.characters[index];
        return ListTile(
          leading: CircleAvatar(backgroundImage: NetworkImage(character.image)),
          title: Text(character.name),
          subtitle: Text('${character.species} - ${character.status}'),
        );
      },
    );
  }
}
