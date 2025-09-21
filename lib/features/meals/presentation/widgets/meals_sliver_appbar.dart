import 'package:flutter/material.dart';
import 'package:one_studio_task/core/config/app_colors.dart';
import 'package:one_studio_task/features/meals/presentation/widgets/appbar_background.dart';
import 'package:one_studio_task/features/meals/presentation/widgets/search_and_filter.dart';

class MealsSliverAppbar extends StatelessWidget {
  final TextEditingController searchController;
  final Function()? onTapFilter;
  final Function(String)? onSearchChanged;
  final Function()? onSearchDelete;

  const MealsSliverAppbar({super.key, required this.searchController, this.onTapFilter, this.onSearchChanged, this.onSearchDelete});

  @override
  Widget build(BuildContext context) {
    return SliverFloatingHeader(
      child: Container(
        width: double.infinity,
        color: AppColors.scaffoldColor,
        child: Column(
          spacing: MediaQuery.sizeOf(context).height * 0.08,
          children: [
            AppbarBackground(),
            SearchAndFilter(controller: searchController, onTapFilter: onTapFilter, onSearchChanged: onSearchChanged, onSearchDelete: onSearchDelete)
          ],
        ),
      ),
    );
  }
}