import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe/domain/entities/grid.entity.dart';
import 'package:tictactoe/foundation/enum/form.enum.dart' as form_enum;
import 'package:tictactoe/presentation/screens/home/home.state.dart';
import 'package:tictactoe/presentation/screens/home/home.view_model.dart';
import 'package:tictactoe/presentation/widgets/custom_button.dart';

/// Home Screem
@RoutePage()
class HomeScreen extends ConsumerStatefulWidget {
  /// Constructor

  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final HomeViewModel viewModel = ref.watch(homeViewModelProvider.notifier);
    final HomeState state = ref.watch(homeViewModelProvider);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              CustomButton(title: 'Démarrer', onTap: viewModel.startGame),

              if (state.grid != null)
                _GameGrid(),
            ],
          ),
        ),
      ),
    );
  }
}

class _GameGrid extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final  HomeViewModel viewModel = ref.watch(homeViewModelProvider.notifier);
    final  HomeState state = ref.watch(homeViewModelProvider);
    final int totalCells = state.grid!.totalCells;
    final int rowColumnLenght = state.grid!.columnsRowsAmount;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Builder(
        builder: (BuildContext c) {
    
          return Wrap(
            spacing: 8,
            runSpacing: 8,
            alignment: WrapAlignment.center,
            children: List<Widget>.generate(totalCells, (int index) {
              final int row = index ~/ rowColumnLenght;
              final int column = index % rowColumnLenght;
              final  form_enum.Form? currentCell =
                  state.grid!.grid[row]?.columns[column]!.form;
    
              return InkWell(
                onTap: () =>
                    viewModel.tapOnCell(row: row, column: column),
                child: SizedBox(
                  width:
                      MediaQuery.of(c).size.width / rowColumnLenght - 16,
                  height: 60,
                  child: Card(
                    color: index.isEven
                        ? Colors.white
                        : Colors.grey,
                    child: Center(
                      child: Text(
                        (() {
                          switch (currentCell) {
                            case .cross:
                              return form_enum.Form.cross.value;
                            case .circle:
                              return form_enum.Form.circle.value;
                            case .empty:
                              return form_enum.Form.empty.value;
                            case null:
                              throw UnimplementedError();
                          }
                        })(),
                        style: const TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
