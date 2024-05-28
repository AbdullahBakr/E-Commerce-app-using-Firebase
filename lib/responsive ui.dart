// import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

class try2 extends StatelessWidget {
  const try2({super.key});

  @override
  Widget build(BuildContext context) {
   double screenWidth = MediaQuery.of(context).size.width;
   double screenHeight=MediaQuery.of(context).size.height;
   var mediaquery=MediaQueryData();

   return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        color: Colors.black,
        child: Center(
          child: LayoutBuilder(
            builder: (context,constraints){
              double localHeight=constraints.maxHeight;
              double localWidth = constraints.maxWidth;
              var get_device = getDeviceType(mediaquery);
              print(get_device);
              print('heigh is $screenHeight');
              print("local height is $localHeight");
              print("width is $screenWidth");
              print('local width $localWidth');

              return Container(
                width: localWidth/2 ,
                height: localHeight/2,
                color: Colors.red,
              );
            },

          ),
        ),

      ),
    );
  }
}

enum DeviceType {
  Desktop,
  Tablet ,
  Mobile,
}
DeviceType getDeviceType(MediaQueryData mediaQuery){
  Orientation orientation =mediaQuery.orientation;
  double width=0;
  if(orientation== Orientation.landscape){
    width=mediaQuery.size.height;
  } else {
    width=mediaQuery.size.width;
  } if(width >=950){
    return DeviceType.Desktop;
  }
  if(width>=650){
    return DeviceType.Tablet;
  } else {
    return DeviceType.Mobile;
  }
}