import 'package:flutter/material.dart';
import 'package:recipeapp/models/model_allrecipes.dart';
import 'package:recipeapp/services/http_connect.dart';
import 'package:recipeapp/views/Recipe.dart';

class AllRecipesScreen extends StatefulWidget {
  final List<Items>? recipes;

  const AllRecipesScreen({Key? key, this.recipes}) : super(key: key);

  @override
  State<AllRecipesScreen> createState() => _AllRecipesScreenState();
}

class _AllRecipesScreenState extends State<AllRecipesScreen> {
  List<Items>? recipes;

  @override
  void initState() {
    super.initState();
    recipes = widget.recipes;
  }

  Future<void> _fetchRecipeDetails(String link) async {
    try {
      final result = await HttpConnect.postData(data: {'link': link}, endpoint: 'recipe');
      // Navegar para RecipeScreen passando os dados da receita
      print(result);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RecipeScreen(recipeData: Autogenerated.fromJson(result).data!)),
      );
    } catch (e) {
      print('Erro ao carregar detalhes da receita: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todas as Receitas"),
      ),
      body: Center(
        child: recipes != null
            ? ListView.builder(
                itemCount: recipes!.length,
                itemBuilder: (context, index) {
                  final recipe = recipes![index];
                  return GestureDetector(
                    onTap: () {
                      _fetchRecipeDetails(recipe.link ?? '');
                    },
                    child: Card(
                      margin: EdgeInsets.all(8),
                      child: ListTile(
                        leading: Image.network(recipe.image ?? ''),
                        title: Text(recipe.name ?? ''),
                        subtitle: Text(recipe.duration ?? ''),
                      ),
                    ),
                  );
                },
              )
            : CircularProgressIndicator(),
      ),
    );
  }
}
