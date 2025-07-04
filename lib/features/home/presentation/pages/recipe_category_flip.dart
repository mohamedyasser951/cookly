import 'package:cached_network_image/cached_network_image.dart';
import 'package:cookly/core/widgets/app_spacer.dart';
import 'package:cookly/features/home/data/models/recipes_response.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';

class RecipeCategoryFlip extends StatelessWidget {
  final List<Recipe> recipes;

  const RecipeCategoryFlip({super.key, required this.recipes});

  @override
  Widget build(BuildContext context) {
    final controller = GlobalKey<PageFlipWidgetState>();
    List<List<Recipe>> recipeChunks = [];
    for (int i = 0; i < recipes.length; i += 10) {
      recipeChunks.add(
        recipes.sublist(i, i + 10 > recipes.length ? recipes.length : i + 10),
      );
    }
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageFlipWidget(
              key: controller,
              backgroundColor: Colors.white,
              onFlipStart: () {
                print("Flip started");
              },

              lastPage: Container(
                color: Colors.white,
                child: const Center(child: Text('Last Page!')),
              ),
              children: List.generate(
                recipeChunks.length,
                (index) =>
                    RecipeCardCatalog(page: index, recipe: recipeChunks[index]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    heroTag: 'previous',
                    child: const Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      controller.currentState?.previousPage();
                    },
                  ),
                  const SizedBox(width: 10),

                  FloatingActionButton(
                    heroTag: 'next',
                    child: const Icon(Icons.arrow_forward_ios),
                    onPressed: () {
                      controller.currentState?.nextPage();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RecipeCardCatalog extends StatefulWidget {
  final int page;
  final List<Recipe> recipe;

  const RecipeCardCatalog({
    super.key,
    required this.page,
    required this.recipe,
  });

  @override
  State<RecipeCardCatalog> createState() => _DemoPageState();
}

class _DemoPageState extends State<RecipeCardCatalog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        // padding: EdgeInsets.all(8.sp),
        itemCount: widget.recipe.length,
        separatorBuilder: (context, index) => AppSpacer(heightRatio: 0.5),
        itemBuilder:
            (context, index) => MenuCard(
              image: widget.recipe[index].image,
              title: widget.recipe[index].name,
              description: widget.recipe[index].ingredients.join(', '),
            ),
      ),
    );
  }
}

class MenuCard extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const MenuCard({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: CachedNetworkImage(
              imageUrl: image,
              fit: BoxFit.cover,
              height: 220,
              width: double.infinity,
            ),
          ),

          // Content section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.restaurant_menu, color: Colors.deepOrange),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Divider(height: 1, color: Colors.grey),
                const SizedBox(height: 12),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
