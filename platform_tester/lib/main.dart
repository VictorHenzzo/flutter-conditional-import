import 'package:flutter/material.dart';
import 'package:platform_hello_world/platform_hello_world.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final helloWorld = HeloWorld();
    final theme = Theme.of(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              helloWorld.greetings(),
              style: theme.textTheme.titleLarge?.copyWith(
                color: Colors.black,
              ),
            ),
            SizedBox(height: 30),
            RenameTab(),
          ],
        ),
      ),
    );
  }
}

class RenameTab extends StatefulWidget {
  const RenameTab({super.key});

  @override
  State<RenameTab> createState() => _RenameTabState();
}

class _RenameTabState extends State<RenameTab> {
  late TextEditingController controller;
  String? error;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Text(
          'Atualizar nome da aba',
          style: theme.textTheme.bodyLarge?.copyWith(
            color: Colors.black,
          ),
        ),
        SizedBox(height: 5),
        SizedBox(
          width: 300,
          child: TextFormField(
            controller: controller,
          ),
        ),
        SizedBox(height: 5),
        ElevatedButton(
          onPressed: _onPressed,
          child: Text('Atualizar'),
        ),
        SizedBox(height: 5),
        if (error != null) Text('Erro: ${error}')
      ],
    );
  }

  Future<void> _onPressed() async {
    try {
      await renameBrowserTab(controller.text);
    } catch (e) {
      setState(() {
        error = e.toString();
      });
    }
  }
}
