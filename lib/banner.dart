import 'package:flutter/material.dart';

class BannerItem {
  final String bannerImage;
  final String title;
  final String subtitle;

  const BannerItem({
    required this.bannerImage,
    required this.title,
    required this.subtitle,
  });
}

class BannerPage extends StatefulWidget {
  const BannerPage({Key? key}) : super(key: key);

  @override
  State<BannerPage> createState() => _BannerPageState();
}

class _BannerPageState extends State<BannerPage> {
  List<BannerItem> items = [
    const BannerItem(
      title: 'Gatis OngKir \nSelama PPKM!',
      bannerImage: 'images/g.jpg',
      subtitle: 'Periode Mei - Agustus 2021',
    ),
    const BannerItem(
      title: 'These Texts \nare Changeable!',
      bannerImage: 'images/i.jpg',
      subtitle: 'Periode Mei - Agustus 2021',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        child: Column(
          children: [
            SizedBox(
              height: 220,
              child: ListView.separated(
                padding: const EdgeInsets.all(30),
                scrollDirection: Axis.horizontal,
                itemCount: 2,
                separatorBuilder: (context, _) => const SizedBox(width: 16),
                itemBuilder: (context, index) => banner(item: items[index]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: 10, left: 30, top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Featured Product',
                    style: TextStyle(
                        color: Colors.black, fontSize: 20, height: 1.5),
                    textAlign: TextAlign.left,
                  ),
                  MaterialButton(
                    onPressed: null,
                    padding: EdgeInsets.zero,
                    child: Text(
                      'See All',
                      style: TextStyle(
                          color: Colors.blue, fontSize: 15, height: 1.5),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget banner({
    required BannerItem item,
  }) =>
      SizedBox(
          width: 300,
          height: 300,
          child: Stack(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: AspectRatio(
                      aspectRatio: 4 / 3,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          item.bannerImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(80),
                        bottomRight: Radius.circular(80),
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10))),
                color: Color(0xFF3669C9),
                margin: EdgeInsets.zero,
                child: SizedBox(
                  height: 250,
                  width: 180,
                ),
              ),
              Container(
                width: 170,
                height: 165,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(80),
                        bottomRight: Radius.circular(80))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40, bottom: 15),
                      child: Text(
                        item.title,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            height: 1.5),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 35),
                      child: Text(
                        item.subtitle,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ));
}
