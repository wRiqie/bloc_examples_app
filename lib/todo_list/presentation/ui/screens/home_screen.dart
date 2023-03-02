import 'package:bloc_app/todo_list/presentation/blocs/todo/todo_bloc.dart';
import 'package:bloc_app/todo_list/presentation/blocs/todo/todo_event.dart';
import 'package:bloc_app/todo_list/presentation/blocs/todo/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int page = 1;
  final scrollController = ScrollController();

  void scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent) {
      page++;
      BlocProvider.of<TodoBloc>(context).add(TodoGetAllEvent(page, false));
    }
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(scrollListener);
    BlocProvider.of<TodoBloc>(context).add(TodoGetAllEvent(1, true));
  }

  @override
  void dispose() {
    scrollController
      ..removeListener(scrollListener)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          return Visibility(
            visible: state.status.isLoadingMore,
            child: Container(
              height: 50,
              color: Colors.white,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        },
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state.status.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.status.isSuccess || state.status.isLoadingMore) {
            return ListView.builder(
              controller: scrollController,
              itemCount: state.todos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  tileColor: index.isOdd ? Colors.grey[200] : Colors.white,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 40,
                  ),
                  leading: Text(
                    index.toString(),
                    style: const TextStyle(fontSize: 26, color: Colors.black),
                  ),
                  title: Text(
                    state.todos[index].title,
                    style: const TextStyle(fontSize: 26, color: Colors.black),
                  ),
                  subtitle: Text(
                    state.todos[index].body,
                    style: const TextStyle(fontSize: 26, color: Colors.black),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                    size: 34,
                  ),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
