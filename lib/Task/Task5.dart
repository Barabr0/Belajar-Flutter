import 'package:flutter/material.dart';

class Task5 extends StatelessWidget {
  Task5({super.key});

  final List<Map<String, String>> items = [
    {
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOxWAc-BfqTohkYNnp1XACUXANqT_bOhcpaG2Xhs8u4g&s=10',
      'name': 'Yorushika',
      'description': 'Yorushika is a Japanese rock band formed in 2017. The band consists of vocalist n-buna and guitarist suis. They are known for their emotional and poetic lyrics, as well as their unique blend of rock, pop, and electronic music.',
    },
    {
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcToIPPElWiHkuINnw-1eMoGKY3pUSO3cWeasVHtvi-Z9A&s=10',
      'name': 'Yoasobi',
      'description': 'Yoasobi is a Japanese duo known for their unique blend of electronic and pop music.',
    },
    {
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQeMeoQOhRGmdhRaKMLP7l1vBG0_-JPEZELKZVVqSiJZA&s=10',
      'name': 'Myth & Roid',
      'description': 'Myth & Roid is a Japanese electronic rock band known for their energetic performances.',
    },
    {
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsw0OfDOACvlGEMD8N6oqjXPqc3ufBKje1MhqfTt_mKg&s',
      'name': 'Ado',
      'description': 'Ado is a Japanese singer and songwriter known for her powerful vocals and unique style.',
    },
    {
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYQGgvo1tgqfUb8sWrrNOlKiTvlrqXikSiFzndCCmY_g&s=10',
      'name': 'Eve',
      'description': 'Eve is a Japanese singer and songwriter known for his distinctive voice and emotional performances.',
    },
    {
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQspwLFiC2AsUHCIO19krp6KdItCWFBpSy42rxuVj4LFA&s=10',
      'name': 'Deco27',
      'description': 'Deco27 is a Japanese music producer known for Vocaloid songs.',
    },
    {
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSC9yLaOgLPmCpip_qiBi_4OehgFmGDIRLOAXHT4hlk7g&s=10',
      'name': 'Machico',
      'description': 'Machico is a Japanese singer known for her powerful vocals.',
    },
    {
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRv34odMJbJZX4nV2yzABlJfkDm4lFbh6SINmSqO-kJQ&s=10',
      'name': 'OxT',
      'description': 'OxT is a Japanese musical unit known for anime songs.',
    },
    {
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsJNP4MhbgCXpyLCqYe0TZVEKpPtPJ4Wft4lu9mTRjdA&s=10',
      'name': 'Natori',
      'description': 'Natori is a Japanese singer and songwriter known for his distinctive voice.',
    },
    {
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvTZuIKXGY7vBWC3zveMqz3iQCojGMas7G6wTxBD0YDA&s=10',
      'name': 'Zutomayo',
      'description': 'Zutomayo is a Japanese music group known for its distinctive sound.',
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

        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 60,
                  vertical: 10,
                ),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundImage: NetworkImage(
                                items[index]['image']!,
                              ),
                            ),

                            SizedBox(width: 10),

                            Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                Text(
                                  items[index]['name']!,
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

                      SizedBox(
                        width: double.infinity,
                        height: 300,
                        child: Image.network(
                          items[index]['image']!,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Center(
                              child: Icon(
                                Icons.broken_image,
                                size: 50,
                                color: Colors.grey,
                              ),
                            );
                          },
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
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        child: Text(
                          '${items[index]['name']} ${items[index]['description']}',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
