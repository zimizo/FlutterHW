import 'package:flutter/material.dart';

class ExerciseThree extends StatelessWidget {
  const ExerciseThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: ((BuildContext context, BoxConstraints constraints) {
            double width = constraints.constrainWidth();
            return width > 600
                ? ListView.builder(
                    itemCount: 200,
                    itemBuilder: (context, index) {
                      return Card(
                        color: const Color.fromARGB(255, 227, 14, 14)
                            .withOpacity(index / 199),
                        child: ListTile(
                          title: Text('Item $index'),
                        ),
                      );
                    },
                  )
                : SizedBox(
                    height: 200,
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        childAspectRatio: 1,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemCount: 200,
                      itemBuilder: (context, index) {
                        return Card(
                          color: const Color.fromARGB(255, 227, 14, 14)
                              .withOpacity(index / 199),
                          child: ListTile(
                            title: Text('Item $index'),
                          ),
                        );
                      },
                    ),
                  );
          }),
        ),
      ),
    );
  }
}
