// import 'package:flutter/material.dart';

// class DetailsSingleScreen extends StatefulWidget {
//   const DetailsSingleScreen({super.key});

//   @override
//   State<DetailsSingleScreen> createState() => _DetailsSingleScreenState();
// }

// class _DetailsSingleScreenState extends State<DetailsSingleScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(child: Scaffold(
//     body: Text("ggg"),
//     ));
//   }
// }



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_list/features/movies_list/domain/usecases/details_get_movies_list_usecase.dart';
import 'package:get_list/features/movies_list/domain/usecases/get_movies_list_usecase.dart';
import 'package:get_list/features/movies_list/pressentation/blocs/details_get_movies_list_bloc/bloc/detailsgetmovieslist_bloc.dart';
import 'package:get_list/service_locator.dart';

class DetailsSingleScreen extends StatelessWidget {
  final int id; // نوع متغیر id باید مشخص شود
  const DetailsSingleScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) {
            final getMoviesListUsecase = serviceLocator<DetailsGetMoviesListUsecase>();
            final getMoviesListBloc = DetailsgetmovieslistBloc(getMoviesListUsecase);
            getMoviesListBloc.add(LoadedEvent(id)); // افزودن LoadedEvent با id
            return getMoviesListBloc;
          },
          child: BlocBuilder<DetailsgetmovieslistBloc, DetailsgetmovieslistState>(
            builder: (context, state) {
              if (state is LoadingDetailsState) {
                return Center(child: CircularProgressIndicator());
              } else if (state is LoadedDetailsState) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(state.details.title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                          Image.network(state.details.poster,height: 200),
                    ],
                  ),
                );
              } else if (state is ErrorDetailsState) {
                return Center(child: Text(state.message));
              } else {
                return Center(child: Text('No Data'));
              }
            },
          ),
        ),
      ),
    );
  }
}



// class DetailsSingleScreen extends StatelessWidget {
//   final int id; // نوع متغیر id باید مشخص شود
//   const DetailsSingleScreen({super.key, required this.id});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: BlocProvider(
//           create: (context) {
//             final getMoviesListUsecase = serviceLocator<DetailsGetMoviesListUsecase>();
//             final getMoviesListBloc = DetailsgetmovieslistBloc(getMoviesListUsecase);
//             getMoviesListBloc.add(LoadedEvent(id)); // افزودن LoadedEvent با id
//             return getMoviesListBloc;
//           },
//           child: BlocBuilder<DetailsgetmovieslistBloc, DetailsgetmovieslistState>(
//             builder: (context, state) {
//               if (state is LoadingDetailsState) {
//                 return Center(child: CircularProgressIndicator());
//               } else if (state is LoadedDetailsState) {
//                 return Expanded(
//                   child: ListView.builder(
//                     itemCount: state.details.length,
//                     itemBuilder: (context, index) {
//                       return ListTile(
//                         title: Text(state.details[index].title), // فرض کنید DetailsGetMoviesEntity یک فیلد title دارد
//                         subtitle: Text(state.details[index].title), // فرض کنید DetailsGetMoviesEntity یک فیلد description دارد
//                       );
//                     },
//                   ),
//                 );
//               } else if (state is ErrorDetailsState) {
//                 return Center(child: Text(state.message));
//               } else {
//                 return Center(child: Text('No Data'));
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
