// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:web_intern_app/widgets/animated_text.dart';

import 'package:web_intern_app/widgets/keyword_chip.dart';

import '../constants/color.dart';

class JobListTile extends StatefulWidget {
  const JobListTile({
    Key? key,
    required this.company,
    required this.position,
    required this.location,
    required this.logo,
    required this.keywords,
    required this.bgColor,
    required this.postedDate,
  }) : super(key: key);
  final String company;
  final String position;
  final String location;
  final String logo;
  final List<dynamic> keywords;
  final Color bgColor;
  final int postedDate;

  @override
  State<JobListTile> createState() => _JobListTileState();
}

class _JobListTileState extends State<JobListTile> {
  Color textColor = Colors.black;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 10,
      shadowColor: const Color.fromARGB(88, 0, 150, 135),
      margin: const EdgeInsets.only(
        top: 20,
        left: 10,
        right: 10,
        bottom: 4,
      ),
      child: Container(
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //left
            Row(
              children: [
                // Company LOGO

                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    boxShadow: [
                      BoxShadow(
                        color: widget.bgColor.withOpacity(0.8),
                        blurRadius: 5,
                        offset: const Offset(3, 2),
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 35,
                    backgroundColor: widget.bgColor,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                        widget.logo,
                        // fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),

                //Company - position - date- location
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.company,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: titleTextColor,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    AnimatedText(
                      position: widget.position,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          '${widget.postedDate}d ago',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
                          child: Text(
                            '-',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        Text(
                          widget.location,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            //right keywords
            Expanded(
              child: SizedBox(
                width: double.infinity,
                height: 30,
                child: ListView.builder(
                  reverse: true,
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.keywords.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: KeywordChip(
                      title: widget.keywords[index],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
