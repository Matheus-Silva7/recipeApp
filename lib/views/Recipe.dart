/* import 'package:flutter/material.dart';
import 'package:recipeapp/models/model_allrecipes.dart'; // Importar o modelo necessário

class RecipeDetailsScreen extends StatelessWidget {
  final Data recipeData;

  const RecipeDetailsScreen({Key? key, required this.recipeData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipeData.title ?? 'Detalhes da Receita'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              recipeData.title ?? 'Título da Receita',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Ingredientes:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            if (recipeData.ingredients != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: recipeData.ingredients!.map((ingredient) {
                  return Text(
                    '- $ingredient',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  );
                }).toList(),
              ),
            SizedBox(height: 16),
            Text(
              'Passos:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            if (recipeData.recipe != null && recipeData.recipe!.steps != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: recipeData.recipe!.steps!.map((step) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (step.text != null)
                        Text(
                          step.text!,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      if (step.image != null)
                        Image.network(
                          step.image!,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      SizedBox(height: 16),
                    ],
                  );
                }).toList(),
              ),
          ],
        ),
      ),
    );
  }
}
 */