import 'package:cookly/core/utils/request_status.dart';
import 'package:cookly/features/home/data/models/recipes_response.dart';
import 'package:cookly/features/home/presentation/cubits/recipes_cubit/recipes_cubit.dart';
import 'package:cookly/features/home/presentation/widgets/recipes_list_view_builder.dart';
import 'package:cookly/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllRecipesScreen extends StatelessWidget {
  const AllRecipesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<RecipesCubit>()..getAllRecipesEvent(),
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.all(8.0.sp),
          child: Column(
            children: [
              Expanded(
                child: BlocSelector<RecipesCubit, RecipesState, RequestStatus>(
                  selector: (state) => state.allRecipesStatus,
                  builder: (builder, state) {
                    if (state == RequestStatus.loading ||
                        state == RequestStatus.initial) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state == RequestStatus.error) {
                      return BlocSelector<RecipesCubit, RecipesState, String>(
                        selector: (state) {
                          return state.recipesErrorMessage;
                        },
                        builder: (context, state) {
                          return Center(child: Text(state));
                        },
                      );
                    }
                    if (state == RequestStatus.success) {
                      return BlocSelector<
                        RecipesCubit,
                        RecipesState,
                        List<Recipe>
                      >(
                        selector: (state) {
                          return state.recipes;
                        },
                        builder: (context, state) {
                          return RecipesListViewBuilder(recipes: state);
                        },
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
              BlocSelector<RecipesCubit, RecipesState, RequestStatus>(
                selector: (state) => state.pginationStatus,
                builder: (builder, state) {
                  if (state == RequestStatus.error) {
                    return BlocSelector<RecipesCubit, RecipesState, String>(
                      selector: (state) {
                        return state.paginationErrorMessage;
                      },
                      builder: (context, state) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(state, textAlign: TextAlign.center),
                          ),
                        );
                      },
                    );
                  } else if (state == RequestStatus.loading) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const CircularProgressIndicator(),
                    );
                  }
                  return SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
