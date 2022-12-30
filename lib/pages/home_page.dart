import 'package:flutter/material.dart';
import 'package:todo_app/models/todo_models.dart';
import 'package:todo_app/widgets/todo_item.dart';

class HomePage extends StatefulWidget {
  // const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TodoModel> todos = List<TodoModel>.empty(growable: true);
  TextEditingController todoController = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    // var todos;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 36, 15, 88),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 70,
            ),
            // NOTE: TITLE
            const Text(
              'BUKU SAKU NAJIB',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            // NOTE: TODOLIST
            Expanded(
              child: Column(
                children: todos
                        ?.map(
                          (todo) => TodoItem(
                            title: todo.title,
                          ),
                        )
                        .toList() ??
                    [],
              ),
            ),
            Container(
              height: 70,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(
                bottom: 50,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 113, 21, 153),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: todoController,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        decoration: const InputDecoration.collapsed(
                          hintText: 'RENCANA NYA PENGEN....',
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          todos.add(
                            TodoModel(
                              title: todoController.text,
                              isDone: false,
                            ),
                          );

                          todoController.text = '';
                        });
                      },
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
