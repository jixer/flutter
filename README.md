# Flutter Samples
This GitHub repository is used to store various examples of Flutter applications and packages.  It was intended primarily as an aid for a Flutter presentation in Phoenix, AZ in the month of April, 2018.

This repo will probably not be maintained, but may be used as a guid for how to achieve various goals within the Flutter Mobile UI Framework.

Things demonstrated herein include, but are not limited to:
- Flutter Basics
- Layouts and Themes
- Platform-Specific Implementations (Platform Channels)
- Flutter Packages
- Using Platform-Specific Themes

# Flutter Sample Projects
This section will outline the various sample code in this repository and what it intends to demonstrate.

## Hello_World
This Flutter app is the most basic Flutter example in the form of "Hello World".

This app was created using a simple `flutter create`.  Stateful widgets were removed from the source in order to remove excess bloat and demonstrate the most minimum viable application that can be built in Flutter: The Hello World example.

## Batter_Level
This flutter app demonstrates how to use the iOS and Android platform projects in conjunction with MethodChannels in the Dart code.  Through this approach, developers can begin to write applications that tie into OS features that are not available in the Flutter's Dart VM.

References:
- [Platform-Channels Documentation](https://flutter.io/platform-channels)

## Platform_Themes
This flutter app demonstrates how to use Themes within your layout to change the look of your application when it runs on different operating systems.

In addition to color changes, this app also shows you the correct approach (as of 3/30/2018) to utilize `Theme.of(context).platform` in order to populate Cupertino or Material Design widgets based upon the OS where the application is running.