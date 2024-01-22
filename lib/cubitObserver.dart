import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';

//Rename file to main.dart -Materi Cubit Basic & Observer
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

//Konsep BloC

class CounterCubit extends Cubit<int> {
  int defaultNumber;
  int? currentState;
  int? nextState;
  CounterCubit({this.defaultNumber = 0}) : super(defaultNumber);

  void increaseCounter() {
    emit(state + 1);
  }

  void decreaseCounter() {
    emit(state - 1);
  }

  //Observer
  //Perubahan -onChange
  @override
  void onChange(Change<int> change) {
    // TODO: implement onChange
    super.onChange(change);
    currentState = change.currentState;
    nextState = change.nextState + 1;
    print(change);
  }

  //error
  @override
  void onError(Object error, StackTrace stackTrace) {
    // TODO: implement onError
    super.onError(error, stackTrace);
    print(error);
  }
}

class HomePage extends StatelessWidget {
  CounterCubit myCounter = CounterCubit();
  // const HomePage({this.myCounter, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BloC',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder<Object>(
              initialData: myCounter.defaultNumber,
              stream: myCounter.stream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          '${snapshot.data}',
                          style: const TextStyle(fontSize: 56),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Current : ${myCounter.currentState}',
                            style: TextStyle(fontSize: 21),
                          ),
                          const SizedBox(
                            width: 14,
                          ),
                          Text(
                            'Next: ${myCounter.nextState}',
                            style: TextStyle(fontSize: 21),
                          ),
                        ],
                      )
                    ],
                  );
                }
              }),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {
                    myCounter.decreaseCounter();
                  },
                  icon: Icon(Icons.remove)),
              IconButton(
                  onPressed: () {
                    myCounter.increaseCounter();
                  },
                  icon: Icon(Icons.add)),
            ],
          )
        ],
      ),
    );
  }
}

//Konsep Dasar Stream
// class HomePage extends StatelessWidget {
//   const HomePage({super.key});
//   Stream<int> countStream() async* {
//     for (int i = 0; i < 10; i++) {
//       await Future.delayed(Duration(seconds: 1));
//       yield i;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     print('Rebuild');
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Cubit State'),
//       ),
//       body: StreamBuilder(
//         stream: countStream(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           } else {
//             return Center(
//               child: Text(
//                 '${snapshot.data}',
//                 style: TextStyle(fontSize: 56),
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }
// }
