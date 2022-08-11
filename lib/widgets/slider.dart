// ignore_for_file: sort_child_properties_last

import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import 'package:flutter/material.dart'; 
 
class TopSlider extends StatelessWidget {
  const TopSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
 
      child: ImageSlideshow(
            width: double.infinity,
            height: 180,
            initialPage: 0,
            indicatorColor: Colors.purple,
            indicatorBackgroundColor: Colors.grey,
            onPageChanged: (value) {
              debugPrint('Page changed: $value');
            },
            autoPlayInterval: 3000,
            isLoop: true,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/s1.png',
                  fit: BoxFit.fill,
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/s2.png',
                  fit: BoxFit.fill,
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/s3.png',
                  fit: BoxFit.fill,
                ),
              ),
            ],
          
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20)
        ),
        
    );
    
    
  }
}