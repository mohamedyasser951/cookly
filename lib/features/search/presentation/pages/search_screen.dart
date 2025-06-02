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
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      onTapOutside:
                          (event) =>
                              FocusManager.instance.primaryFocus?.unfocus(),
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(24.0.r),
                          ),
                        ),
                        prefixIcon: Icon(Icons.search),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      onChanged: (value) {
                        context.read<SearchCubit>().searchRecipes(value);
                      },
                    ),
                  ),
                  BlocBuilder<SearchCubit, SearchState>(
                    builder: (context, state) {
                      if (state is SearchLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is SearchError) {
                        return Center(child: Text(state.message));
                      } else if (state is SearchEmpty) {
                        return Center(child: Text(state.message));
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
