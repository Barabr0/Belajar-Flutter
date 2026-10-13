import 'package:flutter/material.dart';

class Task5 extends StatelessWidget {
  Task5({super.key});

  final List<Map<String, String>> items = [
    {
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOxWAc-BfqTohkYNnp1XACUXANqT_bOhcpaG2Xhs8u4g&s=10',
      'name': 'Yorushika',
      'content-image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDZUXd3sM7ZSNC7MYL0hu3uSbDNdbfl4_qseFV1JlEaA&s=10',
      'description': 'Yorushika is a Japanese rock band formed in 2017. The band consists of vocalist n-buna and guitarist suis. They are known for their emotional and poetic lyrics, as well as their unique blend of rock, pop, and electronic music.',
    },
    {
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcToIPPElWiHkuINnw-1eMoGKY3pUSO3cWeasVHtvi-Z9A&s=10',
      'name': 'Yoasobi',
      'content-image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1fvmXGJVCByEFMCnz_c7x5nxxIwuVZL5n9dneW9oBgQ&s=10',
      'description': 'Yoasobi is a Japanese duo known for their unique blend of electronic and pop music.',
    },
    {
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQeMeoQOhRGmdhRaKMLP7l1vBG0_-JPEZELKZVVqSiJZA&s=10',
      'name': 'Myth & Roid',
      'content-image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqBqTBvk6j1L0d6NB2VcuK-AYYAjiMAa1VVguh-BziQw&s=10',
      'description': 'Myth & Roid is a Japanese electronic rock band known for their energetic performances.',
    },
    {
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsw0OfDOACvlGEMD8N6oqjXPqc3ufBKje1MhqfTt_mKg&s',
      'name': 'Ado',
      'content-image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2zjDtSHKICkGVDdOzG1nClsbx1jzC87yMUir30gceHw&s=10',
      'description': 'Ado is a Japanese singer and songwriter known for her powerful vocals and unique style.',
    },
    {
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYQGgvo1tgqfUb8sWrrNOlKiTvlrqXikSiFzndCCmY_g&s=10',
      'name': 'Eve',
      'content-image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTC3Pb25L5RcVwOeVo9TnGUfP9X1etC7Ksxl9HMb9XnLQ&s=10',
      'description': 'Eve is a Japanese singer and songwriter known for his distinctive voice and emotional performances.',
    },
    {
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQspwLFiC2AsUHCIO19krp6KdItCWFBpSy42rxuVj4LFA&s=10',
      'name': 'Deco27',
      'content-image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6cFmIr5-eNw9rUvDRiBAK0PHlnK1qmuAuUNbLdITr7Q&s=10',
      'description': 'Deco27 is a Japanese music producer known for Vocaloid songs.',
    },
    {
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSC9yLaOgLPmCpip_qiBi_4OehgFmGDIRLOAXHT4hlk7g&s=10',
      'name': 'Machico',
      'content-image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIcWzccZ_cr6s6xCFQSn1Jsz6s6m6ikrI_X9WGDslHsQ&s=10',
      'description': 'Machico is a Japanese singer known for her powerful vocals.',
    },
    {
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRv34odMJbJZX4nV2yzABlJfkDm4lFbh6SINmSqO-kJQ&s=10',
      'name': 'OxT',
      'content-image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcc5lQaD1JKkcXYXbdSqsrMkmqu-W21B3S9yNz24Burg&s=10',
      'description': 'OxT is a Japanese musical unit known for anime songs.',
    },
    {
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsJNP4MhbgCXpyLCqYe0TZVEKpPtPJ4Wft4lu9mTRjdA&s=10',
      'name': 'Natori',
      'content-image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXuvOqJg5BH3aY2reFdH8ht5QvdeYNpy_EvmipWG3etg&s=10',
      'description': 'Natori is a Japanese singer and songwriter known for his distinctive voice.',
    },
    {
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvTZuIKXGY7vBWC3zveMqz3iQCojGMas7G6wTxBD0YDA&s=10',
      'name': 'Zutomayo',
      'content-image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTW5x-uonxIo9hvk9TMtMuzGWONwpDwhZiD6xa2sA0bdtRpaDHuBz59eDxk&s=10',
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
                          items[index]['content-image']!,
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
