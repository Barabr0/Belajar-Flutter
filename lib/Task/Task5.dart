import 'package:flutter/material.dart';

class Task5 extends StatelessWidget {
  Task5({super.key});

  final List<Map<String, String>> items = [
    {
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOxWAc-BfqTohkYNnp1XACUXANqT_bOhcpaG2Xhs8u4g&s=10',
      'name': 'Yorushika',
    },
    {
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-2VG9vpP7AZgN1Hvz8dmnME-4CLLqrcUAqsrGz5YgAA&s=10',
      'name': 'Yoasobi',
    },
    {
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQeMeoQOhRGmdhRaKMLP7l1vBG0_-JPEZELKZVVqSiJZA&s=10',
      'name': 'Myth & Roid',
    },
    {
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsw0OfDOACvlGEMD8N6oqjXPqc3ufBKje1MhqfTt_mKg&s',
      'name': 'Ado',
    },
    {
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYQGgvo1tgqfUb8sWrrNOlKiTvlrqXikSiFzndCCmY_g&s=10',
      'name': 'Eve',
    },
    {
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQspwLFiC2AsUHCIO19krp6KdItCWFBpSy42rxuVj4LFA&s=10',
      'name': 'Deco27',
    },
    {
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSC9yLaOgLPmCpip_qiBi_4OehgFmGDIRLOAXHT4hlk7g&s=10',
      'name': 'Machico',
    },
    {
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRv34odMJbJZX4nV2yzABlJfkDm4lFbh6SINmSqO-kJQ&s=10',
      'name': 'OxT',
    },
    {
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsJNP4MhbgCXpyLCqYe0TZVEKpPtPJ4Wft4lu9mTRjdA&s=10',
      'name': 'Natori',
    },
    {
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvTZuIKXGY7vBWC3zveMqz3iQCojGMas7G6wTxBD0YDA&s=10',
      'name': 'Zutomayo',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(
                        items[index]['image']!,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(items[index]['name']!),
                  ],
                ),
              );
            },
          ),
        ),
        Divider(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 60),
          child: Container(
            width: double.infinity,
            height: 500,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(
                          items[0]['image']!,
                        ),
                      ),

                      SizedBox(width: 10),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            items[0]['name']!,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            '2 days ago',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),

                      Spacer(),

                      Icon(Icons.more_horiz),
                    ],
                  ),
                ),
                Divider(),
                Container(
                  width: double.infinity,
                  height: 300,
                  child: Image.network(
                    items[0]['image']!,
                    fit: BoxFit.cover,
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.favorite_border,
                        size: 28,
                      ),

                      SizedBox(width: 5),

                      Text('103'),

                      SizedBox(width: 15),

                      Icon(
                        Icons.comment_outlined,
                        size: 28,
                      ),

                      SizedBox(width: 15),

                      Icon(
                        Icons.repeat,
                        size: 28,
                      ),

                      SizedBox(width: 5),

                      Text('3'),

                      SizedBox(width: 15),

                      Icon(
                        Icons.send_outlined,
                        size: 28,
                      ),

                      SizedBox(width: 5),

                      Text('10'),

                      Spacer(),

                      Icon(
                        Icons.bookmark_border,
                        size: 28,
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '${items[0]['name']} The Countdown begins.',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}