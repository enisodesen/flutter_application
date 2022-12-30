import 'package:flutter/material.dart';

import 'utils/job_card.dart';
import 'utils/recent_job_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List jobsForYou = [
    ['Uber', 'UI Designer', 'lib/icons/uber.png', 45],
    ['Google', 'Product Dev', 'lib/icons/google.png', 80],
    ['Apple', 'Software Eng.', 'lib/icons/apple.png', 95],
  ];

  final List recentJobs = [
    ['Nike', 'Web Designer', 'lib/icons/nike.png', 20],
    ['Google', 'Product Dev', 'lib/icons/google.png', 80],
    ['Apple', 'Software Eng.', 'lib/icons/apple.png', 95],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: [
            MainBody(jobsForYou: jobsForYou, recentJobs: recentJobs),
          ],
        ),
      ),
    );
  }
}

class MainBody extends StatelessWidget {
  const MainBody({
    Key? key,
    required this.jobsForYou,
    required this.recentJobs,
  }) : super(key: key);

  final List jobsForYou;
  final List recentJobs;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //app bar

        const SizedBox(
          height: 40,
        ),

        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Container(
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[200],
              ),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Image.asset('lib/icons/menu_from_left.png'),
              )),
        ),

        const SizedBox(
          height: 50,
        ),

        //discover a new path

        const Padding(
          padding: EdgeInsets.only(left: 25),
          child: Text(
            'Discover a New Path',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
          ),
        ),

        const SizedBox(height: 10),
        //search bar

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: SizedBox(
                          height: 30,
                          child: Image.asset('lib/icons/search.png'),
                        ),
                      ),
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search for a job..',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'lib/icons/preferences.png',
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),

        //for you --> job cards

        const Padding(
          padding: EdgeInsets.only(left: 25),
          child: Text(
            'For You',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
          ),
        ),

        const SizedBox(height: 25),

        SizedBox(
          height: 140,
          child: ListView.builder(
              itemCount: jobsForYou.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return JobCard(
                  companyName: jobsForYou[index][0],
                  jobTitle: jobsForYou[index][1],
                  logoImagePath: jobsForYou[index][2],
                  hourlyRate: jobsForYou[index][3],
                );
              }),
        ),

        //recently add --> job tiles

        const SizedBox(
          height: 30,
        ),

        const Padding(
          padding: EdgeInsets.only(left: 25),
          child: Text(
            'Recently Added',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),

        const SizedBox(
          height: 25,
        ),

        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: ListView.builder(
              itemCount: recentJobs.length,
              itemBuilder: (context, index) {
                return RecentJobCards(
                  companyName: recentJobs[index][0],
                  jobTitle: recentJobs[index][1],
                  logoImagePath: recentJobs[index][2],
                  hourlyRate: recentJobs[index][3],
                );
              }),
        )),
      ],
    );
  }
}
