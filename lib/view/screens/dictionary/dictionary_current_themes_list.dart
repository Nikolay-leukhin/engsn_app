import 'package:engsn_corected/logic/home/dictionary/themes/themes_bloc.dart';
import 'package:engsn_corected/view/screens/dictionary/theme_small_card.dart';
import 'package:engsn_corected/view/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DictionaryThemesList extends StatefulWidget {
  const DictionaryThemesList({super.key});

  @override
  State<DictionaryThemesList> createState() => _DictionaryThemesListState();
}

class _DictionaryThemesListState extends State<DictionaryThemesList> {
  void initState() {
    super.initState();
    context.read<ThemesBloc>().add(LoadingThemesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<ThemesBloc>(),
      child: BlocBuilder<ThemesBloc, ThemesState>(
        builder: (c, state) {
          print(state);
          if (state is ThemesLoadingState || state is ThemesInitial) {
            return const Center(child: LoadingIndicator());
          } else if (state is ThemesLoadedSuccess) {
            return ListView.separated(
                itemBuilder: (c, index) {
                  return 
                  DictionaryThemeCard(
                    theme: state.themes[index],
                  );
                },
                separatorBuilder: ((c, index) => const SizedBox(
                      height: 10,
                    )),
                itemCount: state.themes.length);
          } else {
            return Text(
              "Something went wrong",
              style: Theme.of(context).textTheme.labelSmall,
            );
          }
        },
      ),
    );
  }
}
