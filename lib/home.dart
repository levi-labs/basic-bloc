import 'package:cubit/blocs/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//BlocProvider
class HomePage extends StatelessWidget {
  Counter counter = Counter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BloC Provider')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocConsumer<Counter, int>(
            bloc: counter,
            builder: (context, state) {
              return Text(
                '$state',
                style: const TextStyle(
                  fontSize: 32,
                ),
              );
            },
            listener: (context, state) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("More Than 10"),
                  behavior: SnackBarBehavior.floating,
                  margin: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height - 190,
                      left: 5,
                      right: 5),
                ),
              );
            },
            listenWhen: (previous, current) {
              if (current > 10) {
                return true;
              } else {
                return false;
              }
            },
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {
                    counter.decrement();
                  },
                  icon: const Icon(Icons.remove)),
              IconButton(
                  onPressed: () {
                    print(counter.stream);
                    counter.increment();
                  },
                  icon: const Icon(Icons.add))
            ],
          )
        ],
      ),
    );
  }
}


//BlocCunsomer
// class HomePage extends StatelessWidget {
//   Counter counter = Counter();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('BloC Listener')),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           BlocConsumer<Counter, int>(
//             bloc: counter,
//             builder: (context, state) {
//               return Text(
//                 '$state',
//                 style: const TextStyle(
//                   fontSize: 32,
//                 ),
//               );
//             },
//             listener: (context, state) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(
//                   content: Text("More Than 10"),
//                   behavior: SnackBarBehavior.floating,
//                   margin: EdgeInsets.only(
//                       bottom: MediaQuery.of(context).size.height - 190,
//                       left: 5,
//                       right: 5),
//                 ),
//               );
//             },
//             listenWhen: (previous, current) {
//               if (current > 10) {
//                 return true;
//               } else {
//                 return false;
//               }
//             },
//           ),
//           const SizedBox(
//             height: 40,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               IconButton(
//                   onPressed: () {
//                     counter.decrement();
//                   },
//                   icon: const Icon(Icons.remove)),
//               IconButton(
//                   onPressed: () {
//                     print(counter.stream);
//                     counter.increment();
//                   },
//                   icon: const Icon(Icons.add))
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

//BlocListener
// class HomePage extends StatelessWidget {
//   Counter counter = Counter();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('BloC Listener')),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           BlocListener<Counter, int>(
//             bloc: counter,
//             listener: (context, state) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(
//                   content: Text("More Than 10"),
//                   behavior: SnackBarBehavior.floating,
//                   margin: EdgeInsets.only(
//                       bottom: MediaQuery.of(context).size.height - 190,
//                       left: 5,
//                       right: 5),
//                 ),
//               );
//             },
//             listenWhen: (previous, current) {
//               if (current > 10) {
//                 return true;
//               } else {
//                 return false;
//               }
//             },
//             child: BlocBuilder<Counter, int>(
//               bloc: counter,
//               builder: (context, state) {
//                 return Text(
//                   '$state',
//                   style: const TextStyle(
//                     fontSize: 32,
//                   ),
//                 );
//               },
//             ),
//           ),
//           const SizedBox(
//             height: 40,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               IconButton(
//                   onPressed: () {
//                     counter.decrement();
//                   },
//                   icon: const Icon(Icons.remove)),
//               IconButton(
//                   onPressed: () {
//                     print(counter.stream);
//                     counter.increment();
//                   },
//                   icon: const Icon(Icons.add))
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }




//BlocBuilder
// class HomePage extends StatelessWidget {
//   Counter counter = Counter();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('BloC Builder')),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           BlocBuilder<Counter, int>(
//             //buildWhen if value true
//             buildWhen: (previous, current) {
//               if (current % 2 == 0) {
//                 return true;
//               } else {
//                 return false;
//               }
//             },
//             bloc: counter,
//             builder: (context, state) {
//               return Text(
//                 '$state',
//                 style: const TextStyle(
//                   fontSize: 32,
//                 ),
//               );
//             },
//           ),

//           // StreamBuilder(
//           //   initialData: counter.init,
//           //   stream: counter.stream,
//           //   builder: (context, snapshot) {
//           //     return Text(
//           //       '${snapshot.data}',
//           //       style: const TextStyle(
//           //         fontSize: 32,
//           //       ),
//           //     );
//           //   },
//           // ),
//           const SizedBox(
//             height: 40,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               IconButton(
//                   onPressed: () {
//                     counter.decrement();
//                   },
//                   icon: const Icon(Icons.remove)),
//               IconButton(
//                   onPressed: () {
//                     print(counter.stream);
//                     counter.increment();
//                   },
//                   icon: const Icon(Icons.add))
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
