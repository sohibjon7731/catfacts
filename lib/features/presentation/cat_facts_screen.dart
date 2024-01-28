
import 'package:catfacts/features/presentation/bloc/cat_bloc.dart';
import 'package:catfacts/features/presentation/pages/error.dart';
import 'package:catfacts/features/presentation/widgets/history_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';
import 'package:shimmer/shimmer.dart';

class CatFactsScreen extends StatefulWidget {
  const CatFactsScreen({super.key});

  @override
  State<CatFactsScreen> createState() => _CatFactsScreenState();
}

class _CatFactsScreenState extends State<CatFactsScreen> {
  var text_box = Hive.box("text");
  var data_box = Hive.box("data");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF131524),
        title: const Text(
          "Fact about cat",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => HistoryScreen()));
              },
              child: Icon(
                Icons.history,
                color: Colors.red,
              )),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BlocBuilder<CatBloc, CatState>(
              builder: (context, state) {
                if (state.status == LoadingStatus.pure) {
                  context.read<CatBloc>().add(CatEventStarted());
                } else if (state.status == LoadingStatus.failure) {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const ErrorPage()));
                } else if (state.status == LoadingStatus.loading) {
                  return Container(
                    alignment: Alignment.topCenter,
                    child: Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade300,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 300,
                              height: 200,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(32)),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Container(
                              width: 100,
                              height: 20,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                              ),
                            )
                          ],
                        )),
                  );
                }
                return Container(
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topCenter,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(32),
                              child: Image.network(
                                "https://cataas.com/cat?time=${DateTime.now().toIso8601String()}",
                                width: 300,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Text(
                              state.catFacts.text,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            BlocBuilder<CatBloc, CatState>(
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF131524),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12))),
                      onPressed: () {
                        context.read<CatBloc>().add(CatEventStarted());
                      },
                      child: Text("Another Fact"),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    MaterialButton(
                        onPressed: () {
                          text_box.add(state.catFacts.text);

                          data_box.add(state.catFacts.createdAt);
                        },
                        child: Icon(
                          Icons.save,
                          color: Colors.blue,
                          size: 35,
                        )),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
