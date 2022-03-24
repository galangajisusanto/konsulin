import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hackathon_app/core/utils/style.dart';
import 'package:hackathon_app/core/widget/primary_button.dart';
import 'package:hackathon_app/feature/consultation/model/consultant.dart';
import 'package:hackathon_app/feature/consultation/model/review.dart';
import 'package:hackathon_app/feature/consultation/pages/consultation_chat_page.dart';

class ConsultantDetailPage extends StatefulWidget {
  final Consultant consultant;

  const ConsultantDetailPage({Key? key, required this.consultant})
      : super(key: key);

  @override
  _ConsultantDetailPageState createState() => _ConsultantDetailPageState();
}

class _ConsultantDetailPageState extends State<ConsultantDetailPage> {
  List<Review> reviews = [
    Review(
      star: 4,
      name: 'Aji',
      review:
          'Sangat bermanfaat sekali materi yang disampaikan, membuat usaha saya makin maju.',
    ),
    Review(
      star: 5,
      name: 'Bilar',
      review: 'Terimakisih sejak konsultasi jualan saya makin laris. mantapp!',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Detail Konsultan',
          style: Style.headline6,
        ),
        iconTheme: IconThemeData(
          color: Style.black,
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(16, 16, 16, 20),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 133,
                              width: 133,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://anjardhan.com/storage/app/' +
                                        widget.consultant.imageUrl),
                              ),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              widget.consultant.name,
                              style: Style.subTitle1,
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              widget.consultant.profession,
                              style: Style.caption,
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              widget.consultant.expertise,
                              style: Style.caption
                                  .copyWith(color: Style.primaryColor),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.school_sharp,
                      size: 24,
                      color: Style.grayColor,
                    ),
                    title: Text(
                      'Alumni',
                      style: Style.subTitle1,
                    ),
                    subtitle: Text(
                      widget.consultant.alumni,
                      style: Style.subTitle2.copyWith(
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.work,
                      size: 24,
                      color: Style.grayColor,
                    ),
                    title: Text(
                      'Pengalaman Kerja',
                      style: Style.subTitle1,
                    ),
                    subtitle: Text(
                      widget.consultant.workingExperience,
                      style: Style.subTitle2.copyWith(
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.info_outlined,
                      size: 24,
                      color: Style.grayColor,
                    ),
                    title: Text(
                      'LinkedIn',
                      style: Style.subTitle1,
                    ),
                    subtitle: Text(
                      widget.consultant.socialMedia,
                      style: Style.subTitle2.copyWith(
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Review dan Rating',
                      style: Style.subTitle1,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        RatingBar.builder(
                          initialRating: 4,
                          minRating: 0,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          ignoreGestures: true,
                          unratedColor: Style.lightGrayColor1,
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          itemSize: 24,
                          onRatingUpdate: (double value) {},
                        ),
                        Text(
                          '4,5',
                          style: Style.subTitle1
                              .copyWith(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 110,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: reviews.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Container(
                              margin: EdgeInsets.only(top: 16),
                              width: MediaQuery.of(context).size.width * 3 / 4,
                              child: ListTile(
                                title: Row(
                                  children: [
                                    Text(
                                      reviews[index].name,
                                      style: Style.subTitle2,
                                    ),
                                    RatingBar.builder(
                                      initialRating: reviews[index].star,
                                      minRating: 0,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      ignoreGestures: true,
                                      unratedColor: Style.lightGrayColor1,
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      itemSize: 16,
                                      onRatingUpdate: (double value) {},
                                    ),
                                  ],
                                ),
                                subtitle: Column(
                                  children: [
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      reviews[index].review,
                                      style: Style.subTitle2.copyWith(
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: PrimaryButton(
                  title: 'Konsultasi Sekarang',
                  enableBackgroundColor: Style.primaryColor,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ConsultationChatPage()),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
