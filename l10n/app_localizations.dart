import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('pt')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'DJI Mapper'**
  String get appTitle;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @github.
  ///
  /// In en, this message translates to:
  /// **'GitHub'**
  String get github;

  /// No description provided for @helpLoadingMission.
  ///
  /// In en, this message translates to:
  /// **'Help loading mission'**
  String get helpLoadingMission;

  /// No description provided for @dji.
  ///
  /// In en, this message translates to:
  /// **'DJI'**
  String get dji;

  /// No description provided for @litchi.
  ///
  /// In en, this message translates to:
  /// **'Litchi'**
  String get litchi;

  /// No description provided for @updateAvailable.
  ///
  /// In en, this message translates to:
  /// **'Update available'**
  String get updateAvailable;

  /// No description provided for @later.
  ///
  /// In en, this message translates to:
  /// **'Later'**
  String get later;

  /// No description provided for @ignoreThisVersion.
  ///
  /// In en, this message translates to:
  /// **'Ignore this version'**
  String get ignoreThisVersion;

  /// No description provided for @download.
  ///
  /// In en, this message translates to:
  /// **'Download'**
  String get download;

  /// No description provided for @searchLocation.
  ///
  /// In en, this message translates to:
  /// **'Search location'**
  String get searchLocation;

  /// No description provided for @info.
  ///
  /// In en, this message translates to:
  /// **'Info'**
  String get info;

  /// No description provided for @aircraft.
  ///
  /// In en, this message translates to:
  /// **'Aircraft'**
  String get aircraft;

  /// No description provided for @camera.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get camera;

  /// No description provided for @file.
  ///
  /// In en, this message translates to:
  /// **'File'**
  String get file;

  /// No description provided for @createPhotoPoints.
  ///
  /// In en, this message translates to:
  /// **'Create Photo Points'**
  String get createPhotoPoints;

  /// No description provided for @showPhotoPoints.
  ///
  /// In en, this message translates to:
  /// **'Show Photo Points'**
  String get showPhotoPoints;

  /// No description provided for @showWaypoints.
  ///
  /// In en, this message translates to:
  /// **'Show Waypoints'**
  String get showWaypoints;

  /// No description provided for @fillGrid.
  ///
  /// In en, this message translates to:
  /// **'Fill Grid'**
  String get fillGrid;

  /// Number of photos with count
  ///
  /// In en, this message translates to:
  /// **'Number of photos: {count}'**
  String numberOfPhotos(int count);

  /// Number of waypoints with count
  ///
  /// In en, this message translates to:
  /// **'Number of waypoints: {count}'**
  String numberOfWaypoints(int count);

  /// Flight distance with value
  ///
  /// In en, this message translates to:
  /// **'Flight distance: {distance} m'**
  String flightDistance(int distance);

  /// Area with value
  ///
  /// In en, this message translates to:
  /// **'Area: {area} m²'**
  String area(int area);

  /// Estimated flight time with value
  ///
  /// In en, this message translates to:
  /// **'Estimated flight time: {time} minutes'**
  String estimatedFlightTime(int time);

  /// Recommended shutter speed with value
  ///
  /// In en, this message translates to:
  /// **'Recommended shutter speed: {speed} or faster'**
  String recommendedShutterSpeed(String speed);

  /// No description provided for @altitude.
  ///
  /// In en, this message translates to:
  /// **'Altitude (m)'**
  String get altitude;

  /// No description provided for @speed.
  ///
  /// In en, this message translates to:
  /// **'Speed (m/s)'**
  String get speed;

  /// No description provided for @overlap.
  ///
  /// In en, this message translates to:
  /// **'Overlap (%)'**
  String get overlap;

  /// No description provided for @sidelap.
  ///
  /// In en, this message translates to:
  /// **'Sidelap (%)'**
  String get sidelap;

  /// No description provided for @rotation.
  ///
  /// In en, this message translates to:
  /// **'Rotation (°)'**
  String get rotation;

  /// No description provided for @cameraAngle.
  ///
  /// In en, this message translates to:
  /// **'Camera angle (deg)'**
  String get cameraAngle;

  /// No description provided for @delayAtWaypoint.
  ///
  /// In en, this message translates to:
  /// **'Delay at Waypoint (sec)'**
  String get delayAtWaypoint;

  /// No description provided for @onFinished.
  ///
  /// In en, this message translates to:
  /// **'On Finished:'**
  String get onFinished;

  /// No description provided for @hover.
  ///
  /// In en, this message translates to:
  /// **'Hover'**
  String get hover;

  /// No description provided for @rth.
  ///
  /// In en, this message translates to:
  /// **'RTH'**
  String get rth;

  /// No description provided for @land.
  ///
  /// In en, this message translates to:
  /// **'Land'**
  String get land;

  /// No description provided for @goToFirstWaypoint.
  ///
  /// In en, this message translates to:
  /// **'Go to first waypoint'**
  String get goToFirstWaypoint;

  /// No description provided for @onRcLost.
  ///
  /// In en, this message translates to:
  /// **'On RC Lost:'**
  String get onRcLost;

  /// No description provided for @cameraPreset.
  ///
  /// In en, this message translates to:
  /// **'Camera Preset:'**
  String get cameraPreset;

  /// No description provided for @presetTitle.
  ///
  /// In en, this message translates to:
  /// **'Preset Title'**
  String get presetTitle;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @sensorWidth.
  ///
  /// In en, this message translates to:
  /// **'Sensor Width (mm)'**
  String get sensorWidth;

  /// No description provided for @sensorHeight.
  ///
  /// In en, this message translates to:
  /// **'Sensor Height (mm)'**
  String get sensorHeight;

  /// No description provided for @focalLength.
  ///
  /// In en, this message translates to:
  /// **'Focal Length (mm)'**
  String get focalLength;

  /// No description provided for @imageWidth.
  ///
  /// In en, this message translates to:
  /// **'Image Width (px)'**
  String get imageWidth;

  /// No description provided for @imageHeight.
  ///
  /// In en, this message translates to:
  /// **'Image Height (px)'**
  String get imageHeight;

  /// No description provided for @saveAsDjiFlyWaypointMission.
  ///
  /// In en, this message translates to:
  /// **'Save as DJI Fly Waypoint Mission'**
  String get saveAsDjiFlyWaypointMission;

  /// No description provided for @saveAsLitchiMission.
  ///
  /// In en, this message translates to:
  /// **'Save as Litchi Mission'**
  String get saveAsLitchiMission;

  /// No description provided for @importExportMappingArea.
  ///
  /// In en, this message translates to:
  /// **'Import/Export Mapping Area'**
  String get importExportMappingArea;

  /// No description provided for @importFromKml.
  ///
  /// In en, this message translates to:
  /// **'Import from KML'**
  String get importFromKml;

  /// No description provided for @exportToKml.
  ///
  /// In en, this message translates to:
  /// **'Export to KML'**
  String get exportToKml;

  /// No description provided for @selectPolygon.
  ///
  /// In en, this message translates to:
  /// **'Select Polygon'**
  String get selectPolygon;

  /// No description provided for @load.
  ///
  /// In en, this message translates to:
  /// **'Load'**
  String get load;

  /// No description provided for @missionExportCancelled.
  ///
  /// In en, this message translates to:
  /// **'Mission export cancelled'**
  String get missionExportCancelled;

  /// No description provided for @missionExportedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Mission exported successfully'**
  String get missionExportedSuccessfully;

  /// No description provided for @areaImportedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Area imported successfully'**
  String get areaImportedSuccessfully;

  /// No description provided for @areaExportCancelled.
  ///
  /// In en, this message translates to:
  /// **'Area export cancelled'**
  String get areaExportCancelled;

  /// No description provided for @areaExportedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Area exported successfully'**
  String get areaExportedSuccessfully;

  /// No description provided for @noWaypointsToExport.
  ///
  /// In en, this message translates to:
  /// **'No waypoints to export. Please add waypoints first'**
  String get noWaypointsToExport;

  /// No description provided for @noFileSelected.
  ///
  /// In en, this message translates to:
  /// **'No file selected. Import cancelled'**
  String get noFileSelected;

  /// No description provided for @noPolygonsFound.
  ///
  /// In en, this message translates to:
  /// **'No polygons found in KML. Import cancelled'**
  String get noPolygonsFound;

  /// No description provided for @loadMissionIntoDjiFly.
  ///
  /// In en, this message translates to:
  /// **'Load mission into DJI Fly'**
  String get loadMissionIntoDjiFly;

  /// No description provided for @loadMissionIntoLitchi.
  ///
  /// In en, this message translates to:
  /// **'Load mission into Litchi'**
  String get loadMissionIntoLitchi;

  /// No description provided for @step1.
  ///
  /// In en, this message translates to:
  /// **'Step 1'**
  String get step1;

  /// No description provided for @step2.
  ///
  /// In en, this message translates to:
  /// **'Step 2'**
  String get step2;

  /// No description provided for @step3.
  ///
  /// In en, this message translates to:
  /// **'Step 3'**
  String get step3;

  /// No description provided for @step4.
  ///
  /// In en, this message translates to:
  /// **'Step 4'**
  String get step4;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @doNotShowThisAgain.
  ///
  /// In en, this message translates to:
  /// **'Do not show this again'**
  String get doNotShowThisAgain;

  /// No description provided for @exportYourSurveyMission.
  ///
  /// In en, this message translates to:
  /// **'Export your Survey Mission'**
  String get exportYourSurveyMission;

  /// No description provided for @importExportMappingAreaTitle.
  ///
  /// In en, this message translates to:
  /// **'Import/Export Mapping Area'**
  String get importExportMappingAreaTitle;

  /// No description provided for @openDjiFly.
  ///
  /// In en, this message translates to:
  /// **'Open DJI Fly'**
  String get openDjiFly;

  /// No description provided for @quitDjiFly.
  ///
  /// In en, this message translates to:
  /// **'Quit DJI Fly'**
  String get quitDjiFly;

  /// No description provided for @createNewMission.
  ///
  /// In en, this message translates to:
  /// **'Create a new Mission [simple as 1wp] and save'**
  String get createNewMission;

  /// No description provided for @recentDateStamp.
  ///
  /// In en, this message translates to:
  /// **'This will give it a recent date stamp making it easier to find & select'**
  String get recentDateStamp;

  /// No description provided for @iosPath.
  ///
  /// In en, this message translates to:
  /// **'iOS - Goto FILES/DJI Fly/wayline_mission/'**
  String get iosPath;

  /// No description provided for @androidPath.
  ///
  /// In en, this message translates to:
  /// **'Android/DJI RC = Goto Android/data/dji.go.v5/files/waypoint'**
  String get androidPath;

  /// No description provided for @selectMissionFolder.
  ///
  /// In en, this message translates to:
  /// **'Select most recently created Mission Folder by date/time'**
  String get selectMissionFolder;

  /// No description provided for @guidExample.
  ///
  /// In en, this message translates to:
  /// **'Its name will be in the form of a GUID. Example: 6103D3C8-E79A-4B48-BBFE-50932D2E1306'**
  String get guidExample;

  /// No description provided for @renameKmzFile.
  ///
  /// In en, this message translates to:
  /// **'Rename KMZ file that your importing to match the name of this mission on your device.'**
  String get renameKmzFile;

  /// No description provided for @guidExample2.
  ///
  /// In en, this message translates to:
  /// **'Example: 6103D3C8-E79A-4B48-BBFE-50932D2E1306.kmz'**
  String get guidExample2;

  /// No description provided for @uploadRenamedKmz.
  ///
  /// In en, this message translates to:
  /// **'Upload the renamed KMZ into selected mission folder on your device replacing existing KMZ'**
  String get uploadRenamedKmz;

  /// No description provided for @selectUploadedMission.
  ///
  /// In en, this message translates to:
  /// **'Select the mission you just uploaded, should be on the top of the list'**
  String get selectUploadedMission;

  /// No description provided for @examineWaypoints.
  ///
  /// In en, this message translates to:
  /// **'Examine all waypoints before you Fly to be sure they are configured as expected.'**
  String get examineWaypoints;

  /// No description provided for @doNotModifyMission.
  ///
  /// In en, this message translates to:
  /// **'Do not modify or save the mission from inside DJI Fly, because it doesn\'t support straight curves, and will break the mission.'**
  String get doNotModifyMission;

  /// No description provided for @setSettingsCorrectly.
  ///
  /// In en, this message translates to:
  /// **'Set the settings correctly, highlighted in blue are the important settings.'**
  String get setSettingsCorrectly;

  /// No description provided for @finishActionSame.
  ///
  /// In en, this message translates to:
  /// **'The Finish Action should be set the same as in the DJI Mapper'**
  String get finishActionSame;

  /// No description provided for @clickMissionsImport.
  ///
  /// In en, this message translates to:
  /// **'Click on the \'Missions -> Import\' and select the mission file.'**
  String get clickMissionsImport;

  /// No description provided for @saveMissionName.
  ///
  /// In en, this message translates to:
  /// **'Save the mission with a name and it will automatically sync to your device.'**
  String get saveMissionName;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'pt':
      return AppLocalizationsPt();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
