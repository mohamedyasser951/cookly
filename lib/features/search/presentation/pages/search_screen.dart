import 'dart:async';

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
                        return Expanded(
                          child: ListView.builder(
                            itemCount: state.recipes.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(state.recipes[index].name),
                                subtitle: Text(state.recipes[index].cuisine!),
                                onTap: () {},
                              );
                            },
                          ),
                        );
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
