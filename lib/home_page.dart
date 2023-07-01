import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_intern_app/viewmodel/filter_provider.dart';
import 'package:web_intern_app/widgets/filter_bar.dart';
import 'package:web_intern_app/widgets/job_list_tile.dart';
import 'viewmodel/service_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Provider.of<ServiceProvider>(context, listen: false).apiCall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(24, 0, 150, 135),
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Consumer<FilterProvider>(
                  builder: (context, view, _) {
                    return Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 150,
                          color: Colors.teal,
                        ),
                        Container(
                          width: double.infinity,
                          height: view.isExpanded ? 150 : 30,
                          color: Colors.transparent,
                        ),
                        const SizedBox(
                          height: 30,
                        )
                      ],
                    );
                  },
                ),
                const FilterBar(),
              ],
            ),
            Expanded(
              child: Consumer<ServiceProvider>(
                builder: (context, value, child) {
                  final data = value.filteredList(
                    Provider.of<FilterProvider>(context).filterTagList,
                  );
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 100,
                      vertical: 20,
                    ),
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return JobListTile(
                          company: data[index].company,
                          position: data[index].position,
                          keywords: data[index].keywords,
                          location: data[index].location,
                          logo: data[index].logo,
                          bgColor: data[index].bgColor,
                          postedDate: data[index].date,
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
