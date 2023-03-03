import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tok_tik_app/config/theme/app_theme.dart';
import 'package:tok_tik_app/infrastructure/datasources/local_video_datasource_impl.dart';
import 'package:tok_tik_app/infrastructure/repositories/video_post_repository_impl.dart';
import 'package:tok_tik_app/presentation/providers/discover_provider.dart';
import 'package:tok_tik_app/presentation/screens/discover/discover_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final videoPostRepository =
        VideoPostRepositoryImpl(videosDatasource: LocalVideoDatasourceImpl());

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            // lazy: false,
            create: (_) =>
                DiscoverProvider(videoPostRepository: videoPostRepository)
                  ..loadNextPage()),
      ],
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        home: const Scaffold(
            // appBar: AppBar(
            //   title: const Text('Material App Bar'),
            // ),
            body: DiscoverScreen()),
      ),
    );
  }
}
