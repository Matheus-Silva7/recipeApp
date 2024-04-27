import 'package:flutter/material.dart';
import 'package:recipeapp/models/model_categories.dart';
import 'package:recipeapp/services/http_connect.dart';

class CategoriaScreen extends StatefulWidget {
  const CategoriaScreen({Key? key}) : super(key: key);

  @override
  State<CategoriaScreen> createState() => _CategoriaScreenState();
}

class _CategoriaScreenState extends State<CategoriaScreen> {
  List<Data>? categorias;

  @override
  void initState() {
    super.initState();
    _fetchCategorias();
  }

  Future<void> _fetchCategorias() async {
    try {
      final result = await HttpConnect.getData(endpoint: 'categories');
      setState(() {
        categorias = CategoriesRecipe.fromJson(result).data;
      });
    } catch (e) {
      print('Erro ao carregar categorias: $e');
    }
  }

  Future<void> _sendLinkToRecipes(String link) async {
    try {
     
      await HttpConnect.postData(data: {'link': link}, endpoint: 'recipes');
      print('POST enviado para /recipes com sucesso');
    } catch (e) {
      print('Erro ao enviar link para /recipes: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categorias"),
      ),
      body: Center(
        child: categorias != null
            ? ListView.builder(
                itemCount: categorias!.length,
                itemBuilder: (context, index) {
                  final categoria = categorias![index];
                  return GestureDetector(
                    onTap: () {
                      _sendLinkToRecipes(categoria.link ?? '');
                    },
                    child: Container(
                      height: 120,
                      width: double.infinity,
                      color: Colors.blue,
                      margin: EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            categoria.name ?? '',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 8),
                        ],
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

