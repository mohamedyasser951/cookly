import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cookly/core/widgets/app_spacer.dart';
import 'package:cookly/features/home/data/models/recipes_response.dart';
import 'package:cookly/features/search/presentation/search_cubit/search_cubit.dart';
import 'package:cookly/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SearchCubit>(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(title: const Text('Search'), centerTitle: true),
            body: SafeArea(
              child: Column(
                children: [
                  SearchWidget(),
                  BlocBuilder<SearchCubit, SearchState>(
                    builder: (context, state) {
                      if (state is SearchInitial) {
                        return const Expanded(
                          child: Center(
                            child: Text('Search for your favorite Recipe'),
                          ),
                        );
                      }
                      if (state is SearchLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is SearchError) {
                        return Expanded(
                          child: Center(child: Text(state.message)),
                        );
                      } else if (state is SearchEmpty) {
                        return Expanded(
                          child: Center(child: Text(state.message)),
                        );
                      } else if (state is SearchLoaded) {
                        return SearchResultListView(recipes: state.recipes);
                      }
                      return SizedBox.shrink();
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class SearchResultListView extends StatelessWidget {
  final List<Recipe> recipes;

  const SearchResultListView({super.key, required this.recipes});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: recipes.length,
        separatorBuilder: (context, index) => AppSpacer(heightRatio: 0.5),
        itemBuilder: (context, index) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                clipBehavior: Clip.antiAlias,
                borderRadius: BorderRadius.circular(16.r),
                child: CachedNetworkImage(
                  height: 100,
                  width: 120,
                  imageUrl: recipes[index].image,
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              AppSpacer(widthRatio: 0.5),
              Column(
                spacing: 8.h,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    recipes[index].name,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    recipes[index].cuisine!,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    recipes[index].rating.toString(),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

Timer? _debounce;

class _SearchWidgetState extends State<SearchWidget> {
  @override
  dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
        decoration: InputDecoration(
          hintText: 'Search...',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(24.0.r)),
          ),
          prefixIcon: Icon(Icons.search),
          filled: true,
          fillColor: Colors.white,
        ),
        onChanged: (value) {
          if (_debounce?.isActive ?? false) _debounce?.cancel();
          _debounce = Timer(const Duration(milliseconds: 500), () {
            context.read<SearchCubit>().searchRecipes(value);
          });
        },
      ),
    );
  }
}
