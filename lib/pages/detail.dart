// @dart=2.9
import 'package:bwa_kos_course/models/space.dart';
import 'package:bwa_kos_course/theme.dart';
import 'package:bwa_kos_course/widgets/facilities.dart';
import 'package:bwa_kos_course/widgets/rating_item.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'error.dart';

class Detail extends StatefulWidget {
  final Space space;

  Detail(this.space);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    launchUrl(String url) async {
      if (await canLaunch(url)) {
        launch(url);
      } else {
        // throw (url);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ErrorPage(),
            ));
      }
    }

    Future<void> showConfirmation() async {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Confirmation'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('Are you sure want to calling this owner number?'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Calling'),
                onPressed: () {
                  Navigator.of(context).pop();
                  launchUrl('tel:${widget.space.phone}');
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
        backgroundColor: whiteColor,
        body: SafeArea(
            bottom: false,
            child: Stack(
              children: [
                Image.network(
                  widget.space.imageUrl,
                  width: MediaQuery.of(context).size.width,
                  height: 350,
                  fit: BoxFit.cover,
                ),
                ListView(
                  children: [
                    SizedBox(
                      height: 328,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                        color: whiteColor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          // NOTE: TITLE
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: edge),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.space.name,
                                      style:
                                          blackTextStyle.copyWith(fontSize: 22),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text.rich(TextSpan(
                                        text: '\$${widget.space.price}',
                                        style: purpleTextStyle.copyWith(
                                          fontSize: 16,
                                        ),
                                        children: [
                                          TextSpan(
                                              text: '/ month',
                                              style: greyTextStyle.copyWith(
                                                fontSize: 16,
                                              ))
                                        ])),
                                  ],
                                ),
                                Row(
                                  children: [1, 2, 3, 4, 5].map((index) {
                                    return Container(
                                      margin: EdgeInsets.only(
                                        left: 2,
                                      ),
                                      child: RatingItem(
                                        index: index,
                                        rating: widget.space.rating,
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          //NOTE : MAIN FACILITIES
                          Padding(
                            padding: EdgeInsets.only(left: edge),
                            child: Text(
                              'Main Facilities',
                              style: regularTextStyle.copyWith(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: edge,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Facilities(
                                  name: 'Kitchen',
                                  imageUrl: 'assets/images/bar_facilities.png',
                                  total: widget.space.numberOfKitchens,
                                ),
                                Facilities(
                                  name: 'bedroom',
                                  imageUrl: 'assets/images/bed_facilities.png',
                                  total: widget.space.numberOfBedrooms,
                                ),
                                Facilities(
                                  name: 'Big lemari',
                                  imageUrl:
                                      'assets/images/doublebed_facilities.png',
                                  total: widget.space.numberOfCupboards,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          // NOTE: PHOTO
                          Padding(
                            padding: EdgeInsets.only(left: edge),
                            child: Text(
                              'Photos',
                              style: regularTextStyle.copyWith(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Container(
                            height: 88,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: widget.space.photos.map((item) {
                                return Container(
                                  margin: EdgeInsets.only(
                                    left: edge,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(17),
                                    child: Image.network(
                                      item,
                                      width: 110,
                                      height: 88,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          //NOTE: LOCATION
                          Padding(
                            padding: EdgeInsets.only(left: edge),
                            child: Text(
                              'Location',
                              style: regularTextStyle.copyWith(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: edge,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${widget.space.address}\n${widget.space.city}',
                                  style: greyTextStyle,
                                ),
                                InkWell(
                                  onTap: () {
                                    // launchUrl('https://goo.gl/maps/SyZx2yjWB1yR6AeH8');
                                    // launchUrl('qwertyuip');
                                    launchUrl(widget.space.mapUrl);
                                  },
                                  child: Image.asset(
                                    'assets/images/Icon_location_solid.png',
                                    width: 40,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: edge,
                            ),
                            height: 50,
                            width:
                                MediaQuery.of(context).size.width - (2 * edge),
                            child: ElevatedButton(
                              onPressed: () {
                                // launchUrl('tel:${widget.space.phone}');
                                showConfirmation();
                              },
                              child: Text(
                                'Book Now',
                                style: whiteTextStyle.copyWith(
                                  fontSize: 18,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: purpleColor,
                                  shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(17))),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: edge,
                    vertical: 30,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset(
                          'assets/images/btn_back.png',
                          width: 40,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isClicked = !isClicked;
                          });
                        },
                        child: Image.asset(
                          isClicked
                              ? 'assets/images/btn_wishlist_filled.png'
                              : 'assets/images/btn_wishlist.png',
                          width: 40,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }
}
