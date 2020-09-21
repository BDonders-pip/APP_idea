import 'package:app_ingredients/features/ingredients_app/presentation/bloc/ingredient_cubit.dart';
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

  buildBody(BuildContext context) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(children: <Widget>[
            SizedBox(height: 10),
            // Top half
            BlocConsumer<IngredientCubit, IngredientState>(
              // ignore: missing_return
              listener: (context, state) {
                if (state is IngredientError) {
                  return MessageDisplay(
                    message: state.message,
                  );
                }
              },
              // ignore: missing_return
              builder: (context, state) {
                if (state is IngredientInitial) {
                  return MessageDisplay(
                    message: "Start searching!",
                  );
                } else if (state is IngredientLoading) {
                  return LoadingWidget();
                } else if (state is IngredientLoaded) {
                  return IngredientDisplay(ingredient: state.ingredient);
                }
              },
            ),
            SizedBox(height: 20),
            // Bottom half
            IngredientControls()
          ],
          ),
        ),
      );
  }
}
