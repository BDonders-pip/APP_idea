import 'package:app_ingredients/features/ingredients_app/presentation/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_ingredients/features/ingredients_app/presentation/widgets/test_widgets/widgets.dart';

import '../../../../injection_container.dart';

class IngredientTestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Number Trivia"),
      ),
      body: SingleChildScrollView(
        child: buildBody(context),
      ),
    );
  }

  BlocProvider<IngredientBloc> buildBody(BuildContext context) {
    return BlocProvider(
      builder: (_) => sl<IngredientBloc>(),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(children: <Widget>[
            SizedBox(height: 10),
            // Top half
            BlocBuilder<IngredientBloc, IngredientState>(
              builder: (context, state) {
                if (state is Empty) {
                  return MessageDisplay(
                    message: "Start searching!",
                  );
                } else if (state is Loading) {
                  return LoadingWidget();
                } else if (state is Loaded) {
                  return IngredientDisplay(ingredient: state.ingredient,);
                } else if (state is Error) {
                  return MessageDisplay(
                    message: state.message,
                  );
                }
              },
            ),
            SizedBox(height: 20),
            // Bottom half
            IngredientControls()
          ],
          ),
        ),
      ),
    );
  }
}
