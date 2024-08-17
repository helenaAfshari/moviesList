import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_list/core/debouncer/debouncer.dart';
import 'package:get_list/features/movies_list/domain/entities/get_movies_list_entity.dart';
import 'package:get_list/features/movies_list/domain/usecases/get_movies_list_usecase.dart';
import 'package:get_list/features/movies_list/pressentation/blocs/moviesbloc/get_movies_list_bloc.dart';
import 'package:get_list/features/movies_list/pressentation/pages/details_single_screen.dart';
import 'package:get_list/service_locator.dart';

class MyHomePage extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();
  final id;
  
   MyHomePage({super.key,this.id});
   //اینجا بعد از هر حرفی که صدازده شد یک و نیم ثانیه بعد بیا انجام بده یا حالا از سرور یا نه
   DBouncer dBouncer = DBouncer(milliseconds: 1500); 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) {
          final getMoviesListUsecase = serviceLocator<GetMoviesListUsecase>();      
          final getMoviesListBloc = GetMoviesListBloc(
            getMoviesListUsecase,
          
          );
          getMoviesListBloc.add(SearchBarEvent(_searchController.text));
          return getMoviesListBloc;
        },
        child: 

        SafeArea(
          child: Column(
            children: [

              Expanded(
                child: BlocBuilder<GetMoviesListBloc, GetMoviesListState>(
                  builder: (context, state) {
                    if (state is LoadingGetMoviesList) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is LoadedGetMoviesList) {
                      final List<GetMoviesListEntity> movies = state.movies;
                      // در صورتی که کلمه کلیدی سرچ ارسال بشه ایتم هایی که شامل کلمه کلیدی باشن نشون داده میشه
                      final List<GetMoviesListEntity> searchMovieList = state.movies.where((movie) => 
                      movie.title.contains(_searchController.text)).toList();
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                              SizedBox(height: 40,),
                            TextField(
                            
                              controller: _searchController,
                              onChanged: (inputText) {
                                // برای این که مداوم ایونت ارسال نشه از delay استفاده شده
                                // Future.delayed(const Duration(seconds: 2)).then((value) {
                                //   BlocProvider.of<GetMoviesListBloc>(context).add(SearchBarEvent(_searchController.text));
                                // },);
                                dBouncer.run((){
                          BlocProvider.of<GetMoviesListBloc>(context).add(SearchBarEvent(_searchController.text));

                                });
                              },
                              decoration: InputDecoration(
                              
                              hintText: "کلمه مورد نظر را سرچ کنید",
                                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(50)))
                              ),
                            ),
                            SizedBox(
                              height: 600,
                              width: double.infinity,
                              child:ListView.builder(
  shrinkWrap: true,
  itemCount: _searchController.text == '' ? movies.length : searchMovieList.length,
  itemBuilder: (context, index) {
    final GetMoviesListEntity movie;
    if (searchMovieList.isEmpty) {
      movie = movies[index];
    } else {
      movie = searchMovieList[index];
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsSingleScreen(
                id: movie.id,
              ),
            ),
          );
        },
        child:Container(
  color: Colors.amber,
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(movie.title),
      Wrap(
        spacing: 8.0, // فاصله بین عناصر
        runSpacing: 8.0, // فاصله بین ردیف‌ها
        children: movie.genres.map((genre) => Text(genre)).toList(),
      ),
      Wrap(
        spacing: 8.0, // فاصله بین تصاویر
        runSpacing: 8.0, // فاصله بین ردیف‌های تصاویر
        children: movie.images.map((image) => 
          Container(
            width: 100.0, // عرض تصویر
            height: 100.0, // ارتفاع تصویر
            child: Image.network(image, fit: BoxFit.cover),
          )
        ).toList(),
      ),
    ],
  ),
)

      ),
    );
  },
)
,
                            //   child: ListView.builder(
                            //     shrinkWrap: true,
                            //     itemCount: 
                            // _searchController.text == ''? movies.length : searchMovieList.length,
                            //     itemBuilder: (context, index) {
                            //       final GetMoviesListEntity movie;
                            //       if(searchMovieList.isEmpty){
                            //         movie = movies[index];
                            //       } else {
                            //         movie = searchMovieList[index];
                            //       }
                            //       return Padding(
                            //         padding: const EdgeInsets.all(8.0),
                            //         child: GestureDetector(
                            //           onTap: () {
                            //             print("ffffff${movie.id}");
                            //             Navigator.push(context,MaterialPageRoute(
                            //               builder: (context) => 
                            //           DetailsSingleScreen(
                            //         id: state.movies[index].id,
                                  
                                    
                            //         ),));
                            //           },
                            //           child: Container(
                            //             height: 50,
                            //             width: 50,
                            //             color: Colors.amber,
                            //             child: Row(
                            //               children: [
                            //                 Text(movie.title),
                            //                if (index < movie.genres.length)
                            //                   Text(movie.genres[index]),
                            //                 if (index < movie.images.length)
                            //                   Image.network(movie.images[index]),
                            //               ],
                            //             ),
                            //           ),
                            //         ),
                            //       );
                            //     },
                            //   ),
                            ),
                          ],
                        ),
                      );
                    } 
                   
                    else if (state is ErrorGetMoviesList) {
                      return Center(
                        child: Text(state.message),
                      );
                    } else {
                      return Center(
                        child: Text("Unexpected State"),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
