import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

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
  static const List<Locale> supportedLocales = <Locale>[Locale('en')];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'kcalculus'**
  String get appName;

  /// No description provided for @measureMass.
  ///
  /// In en, this message translates to:
  /// **'Mass'**
  String get measureMass;

  /// No description provided for @measureVolume.
  ///
  /// In en, this message translates to:
  /// **'Volume'**
  String get measureVolume;

  /// No description provided for @measureQuantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get measureQuantity;

  /// No description provided for @measureEnergy.
  ///
  /// In en, this message translates to:
  /// **'Energy'**
  String get measureEnergy;

  /// No description provided for @measureSystemMetric.
  ///
  /// In en, this message translates to:
  /// **'Metric'**
  String get measureSystemMetric;

  /// No description provided for @measureSystemImperial.
  ///
  /// In en, this message translates to:
  /// **'Imperial'**
  String get measureSystemImperial;

  /// No description provided for @measureSystemUS.
  ///
  /// In en, this message translates to:
  /// **'US'**
  String get measureSystemUS;

  /// No description provided for @measureSystemUSLegal.
  ///
  /// In en, this message translates to:
  /// **'US Legal'**
  String get measureSystemUSLegal;

  /// No description provided for @measureSystemUSCustomary.
  ///
  /// In en, this message translates to:
  /// **'US Customary'**
  String get measureSystemUSCustomary;

  /// No description provided for @measureSystemCustomary.
  ///
  /// In en, this message translates to:
  /// **'Customary'**
  String get measureSystemCustomary;

  /// No description provided for @unitCalorie.
  ///
  /// In en, this message translates to:
  /// **'kcal'**
  String get unitCalorie;

  /// No description provided for @unitPiece.
  ///
  /// In en, this message translates to:
  /// **'ea'**
  String get unitPiece;

  /// No description provided for @unitGram.
  ///
  /// In en, this message translates to:
  /// **'g'**
  String get unitGram;

  /// No description provided for @unitKilogram.
  ///
  /// In en, this message translates to:
  /// **'kg'**
  String get unitKilogram;

  /// No description provided for @unitMilligram.
  ///
  /// In en, this message translates to:
  /// **'mg'**
  String get unitMilligram;

  /// No description provided for @unitMicrogram.
  ///
  /// In en, this message translates to:
  /// **'µg'**
  String get unitMicrogram;

  /// No description provided for @unitLitre.
  ///
  /// In en, this message translates to:
  /// **'l'**
  String get unitLitre;

  /// No description provided for @unitMillilitre.
  ///
  /// In en, this message translates to:
  /// **'ml'**
  String get unitMillilitre;

  /// No description provided for @unitPound.
  ///
  /// In en, this message translates to:
  /// **'lb'**
  String get unitPound;

  /// No description provided for @unitOunce.
  ///
  /// In en, this message translates to:
  /// **'oz'**
  String get unitOunce;

  /// No description provided for @unitTeaSpoon.
  ///
  /// In en, this message translates to:
  /// **'tsp'**
  String get unitTeaSpoon;

  /// No description provided for @unitTableSpoon.
  ///
  /// In en, this message translates to:
  /// **'tbsp'**
  String get unitTableSpoon;

  /// No description provided for @unitFluidOunce.
  ///
  /// In en, this message translates to:
  /// **'fl oz'**
  String get unitFluidOunce;

  /// No description provided for @unitCup.
  ///
  /// In en, this message translates to:
  /// **'cup'**
  String get unitCup;

  /// No description provided for @unitPint.
  ///
  /// In en, this message translates to:
  /// **'pt'**
  String get unitPint;

  /// No description provided for @unitQuart.
  ///
  /// In en, this message translates to:
  /// **'qt'**
  String get unitQuart;

  /// No description provided for @unitGallon.
  ///
  /// In en, this message translates to:
  /// **'gal'**
  String get unitGallon;

  /// No description provided for @unitTeaSpoonUS.
  ///
  /// In en, this message translates to:
  /// **'tsp (US)'**
  String get unitTeaSpoonUS;

  /// No description provided for @unitTableSpoonUS.
  ///
  /// In en, this message translates to:
  /// **'tbsp (US)'**
  String get unitTableSpoonUS;

  /// No description provided for @unitFluidOunceUS.
  ///
  /// In en, this message translates to:
  /// **'fl oz (US)'**
  String get unitFluidOunceUS;

  /// No description provided for @unitPintUS.
  ///
  /// In en, this message translates to:
  /// **'pt (US)'**
  String get unitPintUS;

  /// No description provided for @unitQuartUS.
  ///
  /// In en, this message translates to:
  /// **'qt (US)'**
  String get unitQuartUS;

  /// No description provided for @unitGallonUS.
  ///
  /// In en, this message translates to:
  /// **'gal (US)'**
  String get unitGallonUS;

  /// No description provided for @unitCupUSLegal.
  ///
  /// In en, this message translates to:
  /// **'cup (US legal)'**
  String get unitCupUSLegal;

  /// No description provided for @unitCupUSCustomary.
  ///
  /// In en, this message translates to:
  /// **'cup (US customary)'**
  String get unitCupUSCustomary;

  /// No description provided for @nutrientEnergy.
  ///
  /// In en, this message translates to:
  /// **'Calories'**
  String get nutrientEnergy;

  /// No description provided for @nutrientFat.
  ///
  /// In en, this message translates to:
  /// **'Fat'**
  String get nutrientFat;

  /// No description provided for @nutrientSaturatedFat.
  ///
  /// In en, this message translates to:
  /// **'Saturated fat'**
  String get nutrientSaturatedFat;

  /// No description provided for @nutrientTransFat.
  ///
  /// In en, this message translates to:
  /// **'Trans fat'**
  String get nutrientTransFat;

  /// No description provided for @nutrientUnsaturatedFat.
  ///
  /// In en, this message translates to:
  /// **'Unsaturated fat'**
  String get nutrientUnsaturatedFat;

  /// No description provided for @nutrientOmega3Fat.
  ///
  /// In en, this message translates to:
  /// **'Omega 3 fat'**
  String get nutrientOmega3Fat;

  /// No description provided for @nutrientOmega6Fat.
  ///
  /// In en, this message translates to:
  /// **'Omega 6 fat'**
  String get nutrientOmega6Fat;

  /// No description provided for @nutrientOmega9Fat.
  ///
  /// In en, this message translates to:
  /// **'Omega 9 fat'**
  String get nutrientOmega9Fat;

  /// No description provided for @nutrientMonounsaturatedFat.
  ///
  /// In en, this message translates to:
  /// **'Monounsaturated fat'**
  String get nutrientMonounsaturatedFat;

  /// No description provided for @nutrientPolyunsaturatedFat.
  ///
  /// In en, this message translates to:
  /// **'Polyunsaturated fat'**
  String get nutrientPolyunsaturatedFat;

  /// No description provided for @nutrientTotalCarbs.
  ///
  /// In en, this message translates to:
  /// **'Carbohydrates'**
  String get nutrientTotalCarbs;

  /// No description provided for @nutrientFiber.
  ///
  /// In en, this message translates to:
  /// **'Fiber'**
  String get nutrientFiber;

  /// No description provided for @nutrientSugar.
  ///
  /// In en, this message translates to:
  /// **'Sugar'**
  String get nutrientSugar;

  /// No description provided for @nutrientPolyols.
  ///
  /// In en, this message translates to:
  /// **'Polyols (sugar alcohols)'**
  String get nutrientPolyols;

  /// No description provided for @nutrientErythritol.
  ///
  /// In en, this message translates to:
  /// **'Erythritol'**
  String get nutrientErythritol;

  /// No description provided for @nutrientProtein.
  ///
  /// In en, this message translates to:
  /// **'Protein'**
  String get nutrientProtein;

  /// No description provided for @nutrientCholesterol.
  ///
  /// In en, this message translates to:
  /// **'Cholesterol'**
  String get nutrientCholesterol;

  /// No description provided for @nutrientSodium.
  ///
  /// In en, this message translates to:
  /// **'Sodium'**
  String get nutrientSodium;

  /// No description provided for @nutrientPotassium.
  ///
  /// In en, this message translates to:
  /// **'Potassium'**
  String get nutrientPotassium;

  /// No description provided for @nutrientCalcium.
  ///
  /// In en, this message translates to:
  /// **'Calcium'**
  String get nutrientCalcium;

  /// No description provided for @nutrientIron.
  ///
  /// In en, this message translates to:
  /// **'Iron'**
  String get nutrientIron;

  /// No description provided for @nutrientBetaCarotene.
  ///
  /// In en, this message translates to:
  /// **'Beta carotene'**
  String get nutrientBetaCarotene;

  /// No description provided for @nutrientBiotin.
  ///
  /// In en, this message translates to:
  /// **'Biotin'**
  String get nutrientBiotin;

  /// No description provided for @nutrientVitaminA.
  ///
  /// In en, this message translates to:
  /// **'Vitamin A'**
  String get nutrientVitaminA;

  /// No description provided for @nutrientVitaminB1.
  ///
  /// In en, this message translates to:
  /// **'Vitamin B1 (Thiamin)'**
  String get nutrientVitaminB1;

  /// No description provided for @nutrientVitaminB2.
  ///
  /// In en, this message translates to:
  /// **'Vitamin B2 (Riboflavin)'**
  String get nutrientVitaminB2;

  /// No description provided for @nutrientVitaminB3.
  ///
  /// In en, this message translates to:
  /// **'Vitamin B3/PP (Niacin)'**
  String get nutrientVitaminB3;

  /// No description provided for @nutrientVitaminB5.
  ///
  /// In en, this message translates to:
  /// **'Vitamin B5 (Pantothenic acid)'**
  String get nutrientVitaminB5;

  /// No description provided for @nutrientVitaminB6.
  ///
  /// In en, this message translates to:
  /// **'Vitamin B6 (Pyridoxin)'**
  String get nutrientVitaminB6;

  /// No description provided for @nutrientVitaminB9.
  ///
  /// In en, this message translates to:
  /// **'Vitamin B9 (Folic acid)'**
  String get nutrientVitaminB9;

  /// No description provided for @nutrientVitaminB12.
  ///
  /// In en, this message translates to:
  /// **'Vitamin B12 (Cobalamin)'**
  String get nutrientVitaminB12;

  /// No description provided for @nutrientVitaminC.
  ///
  /// In en, this message translates to:
  /// **'Vitamin C (Ascorbic acid)'**
  String get nutrientVitaminC;

  /// No description provided for @nutrientVitaminD.
  ///
  /// In en, this message translates to:
  /// **'Vitamin D (D3)'**
  String get nutrientVitaminD;

  /// No description provided for @nutrientVitaminE.
  ///
  /// In en, this message translates to:
  /// **'Vitamin E'**
  String get nutrientVitaminE;

  /// No description provided for @nutrientVitaminK.
  ///
  /// In en, this message translates to:
  /// **'Vitamin K'**
  String get nutrientVitaminK;

  /// No description provided for @nutrientSilica.
  ///
  /// In en, this message translates to:
  /// **'Silica'**
  String get nutrientSilica;

  /// No description provided for @nutrientBicarbonate.
  ///
  /// In en, this message translates to:
  /// **'Bicarbonate'**
  String get nutrientBicarbonate;

  /// No description provided for @nutrientChloride.
  ///
  /// In en, this message translates to:
  /// **'Chloride'**
  String get nutrientChloride;

  /// No description provided for @nutrientPhosphorus.
  ///
  /// In en, this message translates to:
  /// **'Phosphorus'**
  String get nutrientPhosphorus;

  /// No description provided for @nutrientMagnesium.
  ///
  /// In en, this message translates to:
  /// **'Magnesium'**
  String get nutrientMagnesium;

  /// No description provided for @nutrientZinc.
  ///
  /// In en, this message translates to:
  /// **'Zinc'**
  String get nutrientZinc;

  /// No description provided for @nutrientCopper.
  ///
  /// In en, this message translates to:
  /// **'Copper'**
  String get nutrientCopper;

  /// No description provided for @nutrientManganese.
  ///
  /// In en, this message translates to:
  /// **'Manganese'**
  String get nutrientManganese;

  /// No description provided for @nutrientFluoride.
  ///
  /// In en, this message translates to:
  /// **'Fluoride'**
  String get nutrientFluoride;

  /// No description provided for @nutrientSelenium.
  ///
  /// In en, this message translates to:
  /// **'Selenium'**
  String get nutrientSelenium;

  /// No description provided for @nutrientChromium.
  ///
  /// In en, this message translates to:
  /// **'Chromium'**
  String get nutrientChromium;

  /// No description provided for @nutrientMolybdenum.
  ///
  /// In en, this message translates to:
  /// **'Molybdenum'**
  String get nutrientMolybdenum;

  /// No description provided for @nutrientIodine.
  ///
  /// In en, this message translates to:
  /// **'Iodine'**
  String get nutrientIodine;

  /// No description provided for @nutrientCaffeine.
  ///
  /// In en, this message translates to:
  /// **'Caffeine'**
  String get nutrientCaffeine;

  /// No description provided for @nutrientTaurine.
  ///
  /// In en, this message translates to:
  /// **'Taurine'**
  String get nutrientTaurine;

  /// No description provided for @nutrientChlorophyl.
  ///
  /// In en, this message translates to:
  /// **'Chlorophyl'**
  String get nutrientChlorophyl;

  /// No description provided for @nutrientSulfate.
  ///
  /// In en, this message translates to:
  /// **'Sulfate'**
  String get nutrientSulfate;

  /// No description provided for @nutrientNitrate.
  ///
  /// In en, this message translates to:
  /// **'Nitrate'**
  String get nutrientNitrate;

  /// No description provided for @formatDate.
  ///
  /// In en, this message translates to:
  /// **'EEE, MMM d, yyyy'**
  String get formatDate;

  /// No description provided for @formatTime.
  ///
  /// In en, this message translates to:
  /// **'HH:mm'**
  String get formatTime;

  /// No description provided for @formatDateTime.
  ///
  /// In en, this message translates to:
  /// **'EEE, MMM d, yyyy HH:mm'**
  String get formatDateTime;

  /// No description provided for @formatDouble.
  ///
  /// In en, this message translates to:
  /// **'##0.##'**
  String get formatDouble;

  /// No description provided for @messageUnknownError.
  ///
  /// In en, this message translates to:
  /// **'Oops.. Something went wrong...'**
  String get messageUnknownError;

  /// No description provided for @validationErrorMaxLengthExceeded.
  ///
  /// In en, this message translates to:
  /// **'Value exceeds the maximum allowed length'**
  String get validationErrorMaxLengthExceeded;

  /// No description provided for @screenMeals.
  ///
  /// In en, this message translates to:
  /// **'Daily Log'**
  String get screenMeals;

  /// No description provided for @messageMealDeletionSuccess.
  ///
  /// In en, this message translates to:
  /// **'Meal deleted'**
  String get messageMealDeletionSuccess;

  /// No description provided for @messageMealDeletionFailure.
  ///
  /// In en, this message translates to:
  /// **'Failed to delete the meal'**
  String get messageMealDeletionFailure;

  /// No description provided for @messageNoMeals.
  ///
  /// In en, this message translates to:
  /// **'No meals logged so far...'**
  String get messageNoMeals;

  /// No description provided for @hintEdibleSearchBox.
  ///
  /// In en, this message translates to:
  /// **'Search by name...'**
  String get hintEdibleSearchBox;

  /// No description provided for @messageEdibleSearchNothingFound.
  ///
  /// In en, this message translates to:
  /// **'Nothing found...'**
  String get messageEdibleSearchNothingFound;

  /// No description provided for @screenNewMeal.
  ///
  /// In en, this message translates to:
  /// **'New Meal'**
  String get screenNewMeal;

  /// No description provided for @labelPortionAmount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get labelPortionAmount;

  /// Meal amount measure should be used in nutrition facts
  ///
  /// In en, this message translates to:
  /// **'You specified the meal amount in {unit} of measure {measure}.\nIn at least one \'\'per\'\' field of the nutrition facts, the amount should be specified in units of {measure}.'**
  String messageNoCommonMeasureError(String unit, String measure);

  /// No description provided for @messageEdibleAlreadyExists.
  ///
  /// In en, this message translates to:
  /// **'An edible with this name and description already exists.\nPlease make sure these are unique before saving.'**
  String get messageEdibleAlreadyExists;

  /// No description provided for @messageSelectedEdibleModifiedCreatesNew.
  ///
  /// In en, this message translates to:
  /// **'You made changes to a selected edible.\nSaving will create a new record.\nContinue?'**
  String get messageSelectedEdibleModifiedCreatesNew;

  /// No description provided for @actionUseSelectedEdible.
  ///
  /// In en, this message translates to:
  /// **'No, use selected'**
  String get actionUseSelectedEdible;

  /// No description provided for @actionCreateNewEdible.
  ///
  /// In en, this message translates to:
  /// **'Yes, create new'**
  String get actionCreateNewEdible;

  /// No description provided for @messageSelectedEdibleModifiedAlreadyExists.
  ///
  /// In en, this message translates to:
  /// **'You made changes to a selected edible.\nSaving will create a new record, but an edible with this name and description already exists.\nPlease make sure these are unique before saving.'**
  String get messageSelectedEdibleModifiedAlreadyExists;

  /// No description provided for @actionSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get actionSave;

  /// No description provided for @messageTypeConfirm.
  ///
  /// In en, this message translates to:
  /// **'Confirmation'**
  String get messageTypeConfirm;

  /// No description provided for @messageTypeInfo.
  ///
  /// In en, this message translates to:
  /// **'Information'**
  String get messageTypeInfo;

  /// No description provided for @messageTypeWarning.
  ///
  /// In en, this message translates to:
  /// **'Warning'**
  String get messageTypeWarning;

  /// No description provided for @messageTypeError.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get messageTypeError;

  /// No description provided for @actionOk.
  ///
  /// In en, this message translates to:
  /// **'Ok'**
  String get actionOk;

  /// No description provided for @actionCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get actionCancel;

  /// No description provided for @validationErrorAmountValueMissing.
  ///
  /// In en, this message translates to:
  /// **'Value is required'**
  String get validationErrorAmountValueMissing;

  /// No description provided for @validationErrorAmountValueNaN.
  ///
  /// In en, this message translates to:
  /// **'Must be a number'**
  String get validationErrorAmountValueNaN;

  /// No description provided for @validationErrorAmountValueNegative.
  ///
  /// In en, this message translates to:
  /// **'Can not be a negative number'**
  String get validationErrorAmountValueNegative;

  /// No description provided for @validationErrorAmountValueNotPositive.
  ///
  /// In en, this message translates to:
  /// **'Must be a positive number'**
  String get validationErrorAmountValueNotPositive;

  /// No description provided for @amounValueMask.
  ///
  /// In en, this message translates to:
  /// **'^\\d+\\.?\\d\'{0,2}\''**
  String get amounValueMask;

  /// No description provided for @statCalories.
  ///
  /// In en, this message translates to:
  /// **'{value} kcal'**
  String statCalories(String value);

  /// No description provided for @statFiber.
  ///
  /// In en, this message translates to:
  /// **'Fiber: {value} g'**
  String statFiber(String value);

  /// No description provided for @statFatPercentage.
  ///
  /// In en, this message translates to:
  /// **'Fat: {value}%'**
  String statFatPercentage(String value);

  /// No description provided for @statCarbsPercentage.
  ///
  /// In en, this message translates to:
  /// **'Carbs: {value}%'**
  String statCarbsPercentage(String value);

  /// No description provided for @statProteinPercentage.
  ///
  /// In en, this message translates to:
  /// **'Protein: {value}%'**
  String statProteinPercentage(String value);

  /// No description provided for @actionToday.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get actionToday;

  /// No description provided for @labelEdibleName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get labelEdibleName;

  /// No description provided for @labelEdibleDescription.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get labelEdibleDescription;

  /// No description provided for @hintEdibleDescription.
  ///
  /// In en, this message translates to:
  /// **'Brand or other additional information'**
  String get hintEdibleDescription;

  /// No description provided for @validationErrorEdibleNameMissing.
  ///
  /// In en, this message translates to:
  /// **'Name is required'**
  String get validationErrorEdibleNameMissing;

  /// No description provided for @statWithUnit.
  ///
  /// In en, this message translates to:
  /// **'{value} {unit}'**
  String statWithUnit(String value, String unit);

  /// No description provided for @messageMealDeletionConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Delete this meal?'**
  String get messageMealDeletionConfirmation;

  /// No description provided for @titleNutritionFacts.
  ///
  /// In en, this message translates to:
  /// **'Nutrition Facts'**
  String get titleNutritionFacts;

  /// No description provided for @labelPer.
  ///
  /// In en, this message translates to:
  /// **'Per'**
  String get labelPer;

  /// No description provided for @labelCalories.
  ///
  /// In en, this message translates to:
  /// **'Calories'**
  String get labelCalories;

  /// No description provided for @labelFat.
  ///
  /// In en, this message translates to:
  /// **'Fat'**
  String get labelFat;

  /// No description provided for @labelCarbs.
  ///
  /// In en, this message translates to:
  /// **'Carbs'**
  String get labelCarbs;

  /// No description provided for @labelFiber.
  ///
  /// In en, this message translates to:
  /// **'Fiber'**
  String get labelFiber;

  /// No description provided for @labelProtein.
  ///
  /// In en, this message translates to:
  /// **'Protein'**
  String get labelProtein;

  /// No description provided for @validationErrorMoreFiberThanCarbs.
  ///
  /// In en, this message translates to:
  /// **'Can not be more than carbs'**
  String get validationErrorMoreFiberThanCarbs;

  /// No description provided for @screenEditMeal.
  ///
  /// In en, this message translates to:
  /// **'Edit Meal'**
  String get screenEditMeal;

  /// No description provided for @labelLastEatenAt.
  ///
  /// In en, this message translates to:
  /// **'Last eaten at'**
  String get labelLastEatenAt;

  /// No description provided for @labelNotEatenYet.
  ///
  /// In en, this message translates to:
  /// **'Not eaten yet'**
  String get labelNotEatenYet;

  /// No description provided for @screenFoods.
  ///
  /// In en, this message translates to:
  /// **'Food'**
  String get screenFoods;

  /// No description provided for @messageFoodSearchNothingFound.
  ///
  /// In en, this message translates to:
  /// **'Nothing found...'**
  String get messageFoodSearchNothingFound;

  /// No description provided for @messageFoodDeletionConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Delete this food?'**
  String get messageFoodDeletionConfirmation;

  /// No description provided for @messageFoodDeletionSuccess.
  ///
  /// In en, this message translates to:
  /// **'Food deleted'**
  String get messageFoodDeletionSuccess;

  /// No description provided for @messageFoodDeletionFailure.
  ///
  /// In en, this message translates to:
  /// **'Failed to delete the food'**
  String get messageFoodDeletionFailure;

  /// No description provided for @screenAddFood.
  ///
  /// In en, this message translates to:
  /// **'New Food'**
  String get screenAddFood;

  /// No description provided for @screenEditFood.
  ///
  /// In en, this message translates to:
  /// **'Edit Food'**
  String get screenEditFood;

  /// No description provided for @messageDeletionConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Delete this?'**
  String get messageDeletionConfirmation;

  /// No description provided for @screenDishes.
  ///
  /// In en, this message translates to:
  /// **'Dishes'**
  String get screenDishes;

  /// No description provided for @messageDishSearchNothingFound.
  ///
  /// In en, this message translates to:
  /// **'Nothing found...'**
  String get messageDishSearchNothingFound;

  /// No description provided for @messageDishDeletionConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Delete this dish?'**
  String get messageDishDeletionConfirmation;

  /// No description provided for @messageDishDeletionSuccess.
  ///
  /// In en, this message translates to:
  /// **'Dish deleted'**
  String get messageDishDeletionSuccess;

  /// No description provided for @messageDishDeletionFailure.
  ///
  /// In en, this message translates to:
  /// **'Failed to delete the dish'**
  String get messageDishDeletionFailure;

  /// No description provided for @screenAddDish.
  ///
  /// In en, this message translates to:
  /// **'New Dish'**
  String get screenAddDish;

  /// No description provided for @screenEditDish.
  ///
  /// In en, this message translates to:
  /// **'Edit Dish'**
  String get screenEditDish;

  /// No description provided for @messageNoIngredients.
  ///
  /// In en, this message translates to:
  /// **'No ingredients added yet...'**
  String get messageNoIngredients;

  /// No description provided for @messageIngredientDeletionConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Delete this ingredient?'**
  String get messageIngredientDeletionConfirmation;

  /// No description provided for @messageIngredientDeletionSuccess.
  ///
  /// In en, this message translates to:
  /// **'Ingredient deleted'**
  String get messageIngredientDeletionSuccess;

  /// No description provided for @messageIngredientDeletionFailure.
  ///
  /// In en, this message translates to:
  /// **'Failed to delete the ingredient'**
  String get messageIngredientDeletionFailure;

  /// No description provided for @screenAddIngredient.
  ///
  /// In en, this message translates to:
  /// **'New Ingredient'**
  String get screenAddIngredient;

  /// No description provided for @screenEditIngredient.
  ///
  /// In en, this message translates to:
  /// **'Edit Ingredient'**
  String get screenEditIngredient;

  /// No description provided for @dishWizardPageMain.
  ///
  /// In en, this message translates to:
  /// **'Main'**
  String get dishWizardPageMain;

  /// No description provided for @dishWizardPageIngredients.
  ///
  /// In en, this message translates to:
  /// **'Ingredients'**
  String get dishWizardPageIngredients;

  /// No description provided for @messageDishNoIngredientsError.
  ///
  /// In en, this message translates to:
  /// **'Please add some ingredients'**
  String get messageDishNoIngredientsError;

  /// No description provided for @dishWizardPageMeasurements.
  ///
  /// In en, this message translates to:
  /// **'Measurements'**
  String get dishWizardPageMeasurements;

  /// No description provided for @labelTotal.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get labelTotal;

  /// No description provided for @labelEstimatedTotal.
  ///
  /// In en, this message translates to:
  /// **'Estimated total:'**
  String get labelEstimatedTotal;

  /// No description provided for @validationErrorAmountMustBeOfMeasure.
  ///
  /// In en, this message translates to:
  /// **'Must be {measure}'**
  String validationErrorAmountMustBeOfMeasure(String measure);

  /// No description provided for @validationErrorTotalMustBeHeavierThanContainer.
  ///
  /// In en, this message translates to:
  /// **'Must be heavier than container'**
  String get validationErrorTotalMustBeHeavierThanContainer;

  /// No description provided for @messageDishSelectMeasurementOptionError.
  ///
  /// In en, this message translates to:
  /// **'Please select at least one measurement option'**
  String get messageDishSelectMeasurementOptionError;

  /// No description provided for @dishWizardPageSummary.
  ///
  /// In en, this message translates to:
  /// **'Nutrition Facts'**
  String get dishWizardPageSummary;

  /// No description provided for @validationErrorIngredientsCycleDetected.
  ///
  /// In en, this message translates to:
  /// **'Sorry, this would create a dish-ingredient cycle.'**
  String get validationErrorIngredientsCycleDetected;

  /// No description provided for @titleIngredients.
  ///
  /// In en, this message translates to:
  /// **'Ingredients'**
  String get titleIngredients;

  /// No description provided for @messageConfirmEatenEdibleEdit.
  ///
  /// In en, this message translates to:
  /// **'This was already eaten, so editing it may affect meals history.\nDo you want to make a copy instead?'**
  String get messageConfirmEatenEdibleEdit;

  /// No description provided for @actionEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get actionEdit;

  /// No description provided for @actionCopy.
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get actionCopy;

  /// No description provided for @actionUndo.
  ///
  /// In en, this message translates to:
  /// **'Undo'**
  String get actionUndo;

  /// No description provided for @maintenanceTaskDbMigrationTitle.
  ///
  /// In en, this message translates to:
  /// **'Migrating the database...'**
  String get maintenanceTaskDbMigrationTitle;

  /// No description provided for @maintenanceTaskDbMigrationFailedMessage.
  ///
  /// In en, this message translates to:
  /// **'Database migration failed. Not able to proceed.'**
  String get maintenanceTaskDbMigrationFailedMessage;

  /// No description provided for @screenSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get screenSettings;

  /// No description provided for @settingAppTheme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get settingAppTheme;

  /// No description provided for @settingAppThemeSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get settingAppThemeSystem;

  /// No description provided for @settingAppThemeLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get settingAppThemeLight;

  /// No description provided for @settingAppThemeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get settingAppThemeDark;

  /// No description provided for @databaseErrorFailedToOpen.
  ///
  /// In en, this message translates to:
  /// **'Failed to open the database.'**
  String get databaseErrorFailedToOpen;

  /// No description provided for @mOfN.
  ///
  /// In en, this message translates to:
  /// **'{m} / {n}'**
  String mOfN(int m, int n);

  /// No description provided for @settingCrashReportingTitle.
  ///
  /// In en, this message translates to:
  /// **'Allow crash reporting'**
  String get settingCrashReportingTitle;

  /// No description provided for @settingCrashReportingSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Send anonymous crash reports to improve the app'**
  String get settingCrashReportingSubtitle;

  /// No description provided for @screenConsent.
  ///
  /// In en, this message translates to:
  /// **'Help us improve'**
  String get screenConsent;

  /// No description provided for @dataUsageMotivationMessage.
  ///
  /// In en, this message translates to:
  /// **'We would like to collect data about your usage of the application and use it to improve the experience and stability.\n\nYou can also configure this later in the settings.'**
  String get dataUsageMotivationMessage;

  /// No description provided for @actionProceed.
  ///
  /// In en, this message translates to:
  /// **'Proceed'**
  String get actionProceed;

  /// No description provided for @actionClose.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get actionClose;

  /// No description provided for @actionTryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get actionTryAgain;

  /// No description provided for @messageCantReadFoodFromBarcode.
  ///
  /// In en, this message translates to:
  /// **'Unable to read food information.'**
  String get messageCantReadFoodFromBarcode;

  /// No description provided for @messageFoodFromBarcodeUnsupportedVersion.
  ///
  /// In en, this message translates to:
  /// **'This food was created with an incompatible version of the app and cannot be imported correctly.'**
  String get messageFoodFromBarcodeUnsupportedVersion;

  /// No description provided for @messageNoCameraPermission.
  ///
  /// In en, this message translates to:
  /// **'Camera is not accessible.\nPlease check permissions.'**
  String get messageNoCameraPermission;

  /// No description provided for @settingsGroupBackup.
  ///
  /// In en, this message translates to:
  /// **'Backup'**
  String get settingsGroupBackup;

  /// No description provided for @settingBackupTitle.
  ///
  /// In en, this message translates to:
  /// **'Backup'**
  String get settingBackupTitle;

  /// No description provided for @settingBackupSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Select a directory to store the backup'**
  String get settingBackupSubtitle;

  /// No description provided for @settingRestoreTitle.
  ///
  /// In en, this message translates to:
  /// **'Restore'**
  String get settingRestoreTitle;

  /// No description provided for @settingRestoreSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Select a backup file'**
  String get settingRestoreSubtitle;

  /// No description provided for @messageBackupSuccess.
  ///
  /// In en, this message translates to:
  /// **'Data saved to {path}'**
  String messageBackupSuccess(String path);

  /// No description provided for @messageBackupFailure.
  ///
  /// In en, this message translates to:
  /// **'Failed to backup data'**
  String get messageBackupFailure;

  /// No description provided for @messageRestoreConfirmation.
  ///
  /// In en, this message translates to:
  /// **'PROCEEDING WILL DELETE ALL YOUR CURRENT DATA!\n\nLoad data from {path}?'**
  String messageRestoreConfirmation(String path);

  /// No description provided for @messageRestoreSuccess.
  ///
  /// In en, this message translates to:
  /// **'Data loaded from {path}'**
  String messageRestoreSuccess(String path);

  /// No description provided for @messageRestoreFailure.
  ///
  /// In en, this message translates to:
  /// **'Unable to load data from {path}'**
  String messageRestoreFailure(String path);

  /// No description provided for @messageNoData.
  ///
  /// In en, this message translates to:
  /// **'No data...'**
  String get messageNoData;

  /// No description provided for @screenAgreement.
  ///
  /// In en, this message translates to:
  /// **'Agreement'**
  String get screenAgreement;

  /// No description provided for @actionIAgree.
  ///
  /// In en, this message translates to:
  /// **'I agree'**
  String get actionIAgree;

  /// No description provided for @messageUnlockWithAdConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Watch an unskippable ad to temporary unlock premium features?'**
  String get messageUnlockWithAdConfirmation;

  /// No description provided for @messageUnlockedWithAd.
  ///
  /// In en, this message translates to:
  /// **'Premium features unlocked until\n{until}'**
  String messageUnlockedWithAd(String until);

  /// No description provided for @messagePremiumUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Premium features are unavailable at the moment'**
  String get messagePremiumUnavailable;

  /// No description provided for @settingAnalyticsTitle.
  ///
  /// In en, this message translates to:
  /// **'Allow usage data collection'**
  String get settingAnalyticsTitle;

  /// No description provided for @settingAnalyticsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Help improve the app by sharing anonymous usage data'**
  String get settingAnalyticsSubtitle;

  /// No description provided for @messageSwitchToLogDateConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Meal saved for {date}.\nSwitch to that day?'**
  String messageSwitchToLogDateConfirmation(String date);

  /// No description provided for @settingPremiumTitle.
  ///
  /// In en, this message translates to:
  /// **'Premium status'**
  String get settingPremiumTitle;

  /// No description provided for @settingPremiumSubtitleLocked.
  ///
  /// In en, this message translates to:
  /// **'Unlock premium features'**
  String get settingPremiumSubtitleLocked;

  /// No description provided for @settingPremiumSubtitleUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Premium features unavailable'**
  String get settingPremiumSubtitleUnavailable;

  /// No description provided for @settingPremiumSubtitleUnlocked.
  ///
  /// In en, this message translates to:
  /// **'Premium features unlocked'**
  String get settingPremiumSubtitleUnlocked;

  /// No description provided for @settingPremiumSubtitleUnlockedUntil.
  ///
  /// In en, this message translates to:
  /// **'Premium features unlocked until {until}'**
  String settingPremiumSubtitleUnlockedUntil(String until);

  /// No description provided for @settingDefaultNutrientsTitle.
  ///
  /// In en, this message translates to:
  /// **'Default nutrients'**
  String get settingDefaultNutrientsTitle;

  /// No description provided for @settingDefaultNutrientsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Select default set of nutrients for edibles'**
  String get settingDefaultNutrientsSubtitle;

  /// No description provided for @screenMore.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get screenMore;

  /// No description provided for @moreItemContainersTitle.
  ///
  /// In en, this message translates to:
  /// **'Containers'**
  String get moreItemContainersTitle;

  /// No description provided for @moreItemContainersSubtitle.
  ///
  /// In en, this message translates to:
  /// **'For cooking or storing food'**
  String get moreItemContainersSubtitle;

  /// No description provided for @screenFoodContainers.
  ///
  /// In en, this message translates to:
  /// **'Containers'**
  String get screenFoodContainers;

  /// No description provided for @messageFoodContainerDeletionSuccess.
  ///
  /// In en, this message translates to:
  /// **'Container deleted'**
  String get messageFoodContainerDeletionSuccess;

  /// No description provided for @messageFoodContainerDeletionFailure.
  ///
  /// In en, this message translates to:
  /// **'Failed to delete the container'**
  String get messageFoodContainerDeletionFailure;

  /// No description provided for @hintFoodContainerSearchBox.
  ///
  /// In en, this message translates to:
  /// **'Search by name...'**
  String get hintFoodContainerSearchBox;

  /// No description provided for @messageFoodContainerSearchNothingFound.
  ///
  /// In en, this message translates to:
  /// **'Nothing found...'**
  String get messageFoodContainerSearchNothingFound;

  /// No description provided for @messageFoodContainerDeletionConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Delete this container?'**
  String get messageFoodContainerDeletionConfirmation;

  /// No description provided for @screenAddFoodContainer.
  ///
  /// In en, this message translates to:
  /// **'New Container'**
  String get screenAddFoodContainer;

  /// No description provided for @screenEditFoodContainer.
  ///
  /// In en, this message translates to:
  /// **'Edit Container'**
  String get screenEditFoodContainer;

  /// No description provided for @labelFoodContainerName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get labelFoodContainerName;

  /// No description provided for @validationErrorFoodContainerNameMissing.
  ///
  /// In en, this message translates to:
  /// **'Name is required'**
  String get validationErrorFoodContainerNameMissing;

  /// No description provided for @labelFoodContainerDescription.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get labelFoodContainerDescription;

  /// No description provided for @labelFoodContainerWeight.
  ///
  /// In en, this message translates to:
  /// **'Weight'**
  String get labelFoodContainerWeight;

  /// No description provided for @messageFoodContainerAlreadyExists.
  ///
  /// In en, this message translates to:
  /// **'A container with this name and description already exists.\nPlease make sure these are unique before saving.'**
  String get messageFoodContainerAlreadyExists;

  /// No description provided for @labelFoodContainerSelect.
  ///
  /// In en, this message translates to:
  /// **'Weighing in a container?'**
  String get labelFoodContainerSelect;

  /// No description provided for @labelFoodContainerSelected.
  ///
  /// In en, this message translates to:
  /// **'{name} ({weight} {unit})'**
  String labelFoodContainerSelected(String name, String weight, String unit);

  /// No description provided for @hintNutrientSearchBox.
  ///
  /// In en, this message translates to:
  /// **'Search by name...'**
  String get hintNutrientSearchBox;

  /// No description provided for @messageNutrientSearchNothingFound.
  ///
  /// In en, this message translates to:
  /// **'Nothing found...'**
  String get messageNutrientSearchNothingFound;

  /// No description provided for @screenDefaultNutrients.
  ///
  /// In en, this message translates to:
  /// **'Default Nutrients'**
  String get screenDefaultNutrients;

  /// No description provided for @messageDefaultNutrientDeletionSuccess.
  ///
  /// In en, this message translates to:
  /// **'Nutrient deleted'**
  String get messageDefaultNutrientDeletionSuccess;

  /// No description provided for @messageDefaultNutrientDeletionFailure.
  ///
  /// In en, this message translates to:
  /// **'Failed to delete the nutrient'**
  String get messageDefaultNutrientDeletionFailure;

  /// No description provided for @labelDefaultNutrientRequired.
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get labelDefaultNutrientRequired;

  /// No description provided for @messageDefaultNutrientDeletionConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Delete this nutrient?'**
  String get messageDefaultNutrientDeletionConfirmation;

  /// No description provided for @labelAddNutrient.
  ///
  /// In en, this message translates to:
  /// **'Add nutrient'**
  String get labelAddNutrient;

  /// No description provided for @messageRequiredNutrientsMissing.
  ///
  /// In en, this message translates to:
  /// **'Required nutrients missing:\n\n{nutrients}'**
  String messageRequiredNutrientsMissing(String nutrients);

  /// No description provided for @messageInconsistentNutrients.
  ///
  /// In en, this message translates to:
  /// **'The following nutrients must be provided for all nutrition facts records or omitted entirely:\n\n{nutrients}'**
  String messageInconsistentNutrients(String nutrients);

  /// No description provided for @messageSubNutrientsExceedTotal.
  ///
  /// In en, this message translates to:
  /// **'Sub-nutrients exceed total:\n\n{details}'**
  String messageSubNutrientsExceedTotal(String details);

  /// No description provided for @partExceedsWhole.
  ///
  /// In en, this message translates to:
  /// **' - {part} ({partValue} {partUnit}) > {whole} ({wholeValue} {wholeUnit})'**
  String partExceedsWhole(
    String part,
    String partUnit,
    String partValue,
    String whole,
    String wholeUnit,
    String wholeValue,
  );

  /// No description provided for @appVersion.
  ///
  /// In en, this message translates to:
  /// **'{appName} {version} ({buildNumber})'**
  String appVersion(String appName, String version, String buildNumber);

  /// No description provided for @screenDailyStats.
  ///
  /// In en, this message translates to:
  /// **'Daily Stats'**
  String get screenDailyStats;

  /// No description provided for @settingsGroupDataSharing.
  ///
  /// In en, this message translates to:
  /// **'Data sharing'**
  String get settingsGroupDataSharing;

  /// No description provided for @settingNutrientGoalsTitle.
  ///
  /// In en, this message translates to:
  /// **'Daily goals'**
  String get settingNutrientGoalsTitle;

  /// No description provided for @settingNutrientGoalsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Set daily goals for any nutrient'**
  String get settingNutrientGoalsSubtitle;

  /// No description provided for @screenNutrientGoals.
  ///
  /// In en, this message translates to:
  /// **'Daily Goals'**
  String get screenNutrientGoals;

  /// No description provided for @messageNutrientGoalshNoData.
  ///
  /// In en, this message translates to:
  /// **'No goals so far...'**
  String get messageNutrientGoalshNoData;

  /// No description provided for @messageNutrientGoalDeletionConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Delete this goal?'**
  String get messageNutrientGoalDeletionConfirmation;

  /// No description provided for @messageNutrientGoalDeletionSuccess.
  ///
  /// In en, this message translates to:
  /// **'Goal deleted'**
  String get messageNutrientGoalDeletionSuccess;

  /// No description provided for @messageNutrientGoalDeletionFailure.
  ///
  /// In en, this message translates to:
  /// **'Failed to delete the goal'**
  String get messageNutrientGoalDeletionFailure;

  /// No description provided for @screenAddNutrientGoal.
  ///
  /// In en, this message translates to:
  /// **'New Goal'**
  String get screenAddNutrientGoal;

  /// No description provided for @screenEditNutrientGoal.
  ///
  /// In en, this message translates to:
  /// **'Edit Goal'**
  String get screenEditNutrientGoal;

  /// No description provided for @ofStatWithUnit.
  ///
  /// In en, this message translates to:
  /// **' / {value} {unit}'**
  String ofStatWithUnit(String value, String unit);

  /// No description provided for @statWithUnitLeft.
  ///
  /// In en, this message translates to:
  /// **'{value} {unit} left'**
  String statWithUnitLeft(String value, String unit);

  /// No description provided for @statWithUnitOver.
  ///
  /// In en, this message translates to:
  /// **'{value} {unit} over'**
  String statWithUnitOver(String value, String unit);

  /// No description provided for @percentage.
  ///
  /// In en, this message translates to:
  /// **'{value} %'**
  String percentage(String value);

  /// No description provided for @actionAdjust.
  ///
  /// In en, this message translates to:
  /// **'Adjust'**
  String get actionAdjust;

  /// No description provided for @messageExceededEnergyGoalConfirmation.
  ///
  /// In en, this message translates to:
  /// **'This meal exceeds your calories goal.\nWhat would you like to do?'**
  String get messageExceededEnergyGoalConfirmation;

  /// No description provided for @messageExceededEnergyGoalAdjustableConfirmation.
  ///
  /// In en, this message translates to:
  /// **'This meal exceeds your calories goal, but we can adjust the amount to keep you on track.\nWhat would you like to do?'**
  String get messageExceededEnergyGoalAdjustableConfirmation;

  /// No description provided for @messageDiscardChangesConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Discard changes?'**
  String get messageDiscardChangesConfirmation;

  /// No description provided for @messageScannerDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'The scanner is primarily intended for QR codes generated by this app.\nWhile it may recognize some barcodes using third-party sources, we cannot guarantee the accuracy of the results.\n\nWe recommend verifying nutrition facts manually.'**
  String get messageScannerDisclaimer;

  /// No description provided for @actionDontShowAgain.
  ///
  /// In en, this message translates to:
  /// **'Don\'\'t show again'**
  String get actionDontShowAgain;

  /// No description provided for @maintenanceTaskUsdaFoodDataLoadingTitle.
  ///
  /// In en, this message translates to:
  /// **'Loading common foods...'**
  String get maintenanceTaskUsdaFoodDataLoadingTitle;

  /// No description provided for @maintenanceTaskUsdaFoodDataLoadingFailedMessage.
  ///
  /// In en, this message translates to:
  /// **'Loading common foods failed. Not able to proceed.'**
  String get maintenanceTaskUsdaFoodDataLoadingFailedMessage;

  /// No description provided for @maintenanceTaskUsdaDbMigrationTitle.
  ///
  /// In en, this message translates to:
  /// **'Migrating the common foods database...'**
  String get maintenanceTaskUsdaDbMigrationTitle;

  /// No description provided for @maintenanceTaskUsdaDbMigrationFailedMessage.
  ///
  /// In en, this message translates to:
  /// **'Common foods database migration failed. Not able to proceed.'**
  String get maintenanceTaskUsdaDbMigrationFailedMessage;

  /// No description provided for @screenLogin.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get screenLogin;

  /// No description provided for @labelEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get labelEmail;

  /// No description provided for @validationErrorEmailRequired.
  ///
  /// In en, this message translates to:
  /// **'Email required'**
  String get validationErrorEmailRequired;

  /// No description provided for @validationErrorEmailInvalid.
  ///
  /// In en, this message translates to:
  /// **'Invalid email address'**
  String get validationErrorEmailInvalid;

  /// No description provided for @validationErrorEmailAlreadyInUse.
  ///
  /// In en, this message translates to:
  /// **'Email already in use'**
  String get validationErrorEmailAlreadyInUse;

  /// No description provided for @labelPassword.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get labelPassword;

  /// No description provided for @hintPassword.
  ///
  /// In en, this message translates to:
  /// **'{min}–{max}{upper, select, true{ Ⓐ} other{}}{lower, select, true{ ⓐ} other{}}{digits, select, true{ 0–9} other{}}{special, select, true{ !@#\$%^&*} other{}}'**
  String hintPassword(
    int min,
    int max,
    String upper,
    String lower,
    String digits,
    String special,
  );

  /// No description provided for @validationErrorPasswordRequired.
  ///
  /// In en, this message translates to:
  /// **'Password required'**
  String get validationErrorPasswordRequired;

  /// No description provided for @validationErrorPasswordInvalid.
  ///
  /// In en, this message translates to:
  /// **'Password must:\n• Be {min}–{max} characters long\n• Use only letters, digits, and !@#\$%^&*{upper, select, true{\n• Include at least one uppercase letter} other{}}{lower, select, true{\n• Include at least one lowercase letter} other{}}{digits, select, true{\n• Include at least one digit} other{}}{special, select, true{\n• Include at least one special character} other{}}'**
  String validationErrorPasswordInvalid(
    int min,
    int max,
    String upper,
    String lower,
    String digits,
    String special,
  );

  /// No description provided for @actionLogin.
  ///
  /// In en, this message translates to:
  /// **'Log in'**
  String get actionLogin;

  /// No description provided for @actionCreateNewAccount.
  ///
  /// In en, this message translates to:
  /// **'Create new account'**
  String get actionCreateNewAccount;

  /// No description provided for @actionContinueWithoutAccount.
  ///
  /// In en, this message translates to:
  /// **'Continue without account'**
  String get actionContinueWithoutAccount;

  /// No description provided for @actionForgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get actionForgotPassword;

  /// No description provided for @screenNewAccount.
  ///
  /// In en, this message translates to:
  /// **'New Account'**
  String get screenNewAccount;

  /// No description provided for @labelDisplayName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get labelDisplayName;

  /// No description provided for @validationErrorDisplayNameRequired.
  ///
  /// In en, this message translates to:
  /// **'User name required'**
  String get validationErrorDisplayNameRequired;

  /// No description provided for @labelPasswordConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Password confirmation'**
  String get labelPasswordConfirmation;

  /// No description provided for @validationErrorPasswordMismatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords don\'\'t match'**
  String get validationErrorPasswordMismatch;

  /// No description provided for @validationErrorPasswordTooWeak.
  ///
  /// In en, this message translates to:
  /// **'Password provided is too weak'**
  String get validationErrorPasswordTooWeak;

  /// No description provided for @validationErrorEmailUnverified.
  ///
  /// In en, this message translates to:
  /// **'Email needs verification'**
  String get validationErrorEmailUnverified;

  /// No description provided for @messageEmailVerificationSent.
  ///
  /// In en, this message translates to:
  /// **'Email verification instructions were sent to {email}'**
  String messageEmailVerificationSent(String email);

  /// No description provided for @validationErrorCredentialsInvalid.
  ///
  /// In en, this message translates to:
  /// **'Invalid credentials'**
  String get validationErrorCredentialsInvalid;

  /// No description provided for @validationErrorUserNotFound.
  ///
  /// In en, this message translates to:
  /// **'Account not found'**
  String get validationErrorUserNotFound;

  /// No description provided for @validationErrorUserDisabled.
  ///
  /// In en, this message translates to:
  /// **'Account disabled'**
  String get validationErrorUserDisabled;

  /// No description provided for @messageTooManyRequestsError.
  ///
  /// In en, this message translates to:
  /// **'Too many requests. Please try again later.'**
  String get messageTooManyRequestsError;

  /// No description provided for @messageCheckInboxForInstructions.
  ///
  /// In en, this message translates to:
  /// **'Check your inbox for instructions'**
  String get messageCheckInboxForInstructions;

  /// No description provided for @actionSendAgain.
  ///
  /// In en, this message translates to:
  /// **'SEND AGAIN'**
  String get actionSendAgain;

  /// No description provided for @screenPasswordReset.
  ///
  /// In en, this message translates to:
  /// **'Password Reset'**
  String get screenPasswordReset;

  /// No description provided for @actionResetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset password'**
  String get actionResetPassword;

  /// No description provided for @messagePasswordResetEmailSent.
  ///
  /// In en, this message translates to:
  /// **'Reset password instructions were sent to {email}'**
  String messagePasswordResetEmailSent(String email);

  /// No description provided for @messageLogoutConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to log out?'**
  String get messageLogoutConfirmation;

  /// No description provided for @edibleTypeFood.
  ///
  /// In en, this message translates to:
  /// **'Food'**
  String get edibleTypeFood;

  /// No description provided for @edibleTypeDish.
  ///
  /// In en, this message translates to:
  /// **'Dish'**
  String get edibleTypeDish;

  /// No description provided for @edibleTypeUsda.
  ///
  /// In en, this message translates to:
  /// **'USDA'**
  String get edibleTypeUsda;

  /// No description provided for @edibleLastEaten.
  ///
  /// In en, this message translates to:
  /// **'{daysAgo, select, null{not eaten yet} 0{last eaten today at {time}} 1{last eaten yesterday} 2{last eaten 2 days ago} other{last eaten on {date}}}'**
  String edibleLastEaten(String date, String time, String daysAgo);

  /// No description provided for @perAmount.
  ///
  /// In en, this message translates to:
  /// **'per {value} {unit}'**
  String perAmount(String value, String unit);

  /// No description provided for @maintenanceTaskNutritionFactsPreviewsCreationTitle.
  ///
  /// In en, this message translates to:
  /// **'Creating nutrition facts previews...'**
  String get maintenanceTaskNutritionFactsPreviewsCreationTitle;

  /// No description provided for @maintenanceTaskNutritionFactsPreviewsCreationFailedMessage.
  ///
  /// In en, this message translates to:
  /// **'Creating nutrition facts previews failed. Not able to proceed.'**
  String get maintenanceTaskNutritionFactsPreviewsCreationFailedMessage;

  /// No description provided for @actionAddFood.
  ///
  /// In en, this message translates to:
  /// **'Simple Food'**
  String get actionAddFood;

  /// No description provided for @actionAddDish.
  ///
  /// In en, this message translates to:
  /// **'Complex Dish'**
  String get actionAddDish;

  /// No description provided for @mealEatenAt.
  ///
  /// In en, this message translates to:
  /// **'Eaten at {time}'**
  String mealEatenAt(String time);

  /// No description provided for @tagRecent.
  ///
  /// In en, this message translates to:
  /// **'RECENT'**
  String get tagRecent;

  /// No description provided for @tagDeleted.
  ///
  /// In en, this message translates to:
  /// **'DELETED'**
  String get tagDeleted;

  /// No description provided for @screenImport.
  ///
  /// In en, this message translates to:
  /// **'Import'**
  String get screenImport;

  /// No description provided for @importBookedTitle.
  ///
  /// In en, this message translates to:
  /// **'Import local data to your account?'**
  String get importBookedTitle;

  /// No description provided for @importBookedMessage.
  ///
  /// In en, this message translates to:
  /// **'Data stored on this device can be imported to your account.\n\nImporting will replace any data currently in your account with the data from this device.'**
  String get importBookedMessage;

  /// No description provided for @messageImportConfirmation.
  ///
  /// In en, this message translates to:
  /// **'This will permanently replace the data in your account with the data from this device.\n\nYour current account data will be lost. This action cannot be undone.'**
  String get messageImportConfirmation;

  /// No description provided for @actionImport.
  ///
  /// In en, this message translates to:
  /// **'Import and replace'**
  String get actionImport;

  /// No description provided for @actionDeclineImport.
  ///
  /// In en, this message translates to:
  /// **'Keep account data'**
  String get actionDeclineImport;

  /// No description provided for @importRunningTitle.
  ///
  /// In en, this message translates to:
  /// **'Importing data...'**
  String get importRunningTitle;

  /// No description provided for @importRunningMessage.
  ///
  /// In en, this message translates to:
  /// **'Data from this device is being imported to your account.\nThis may take a few moments.\n\nPlease keep the app open until the import is complete.'**
  String get importRunningMessage;

  /// No description provided for @importStuckTitle.
  ///
  /// In en, this message translates to:
  /// **'Import couldn\'\'t be completed'**
  String get importStuckTitle;

  /// No description provided for @importStuckMessage.
  ///
  /// In en, this message translates to:
  /// **'An import from this device is still marked as in progress but is no longer running.\n\nPlease contact support for assistance.'**
  String get importStuckMessage;

  /// No description provided for @actionContactSupport.
  ///
  /// In en, this message translates to:
  /// **'Contact support'**
  String get actionContactSupport;

  /// No description provided for @importRemoteTitle.
  ///
  /// In en, this message translates to:
  /// **'Import on another device'**
  String get importRemoteTitle;

  /// No description provided for @importRemoteMessage.
  ///
  /// In en, this message translates to:
  /// **'Another device is importing data to your account.\n\nPlease complete the import on that device, or contact support if you cannot access it.'**
  String get importRemoteMessage;

  /// No description provided for @importSucceededTitle.
  ///
  /// In en, this message translates to:
  /// **'Import complete'**
  String get importSucceededTitle;

  /// No description provided for @importSucceededMessageNoReport.
  ///
  /// In en, this message translates to:
  /// **'Data from this device has been imported to your account.'**
  String get importSucceededMessageNoReport;

  /// No description provided for @importSucceededMessageWithReport.
  ///
  /// In en, this message translates to:
  /// **'Data from this device has been imported to your account.\nSee the report below for details.'**
  String get importSucceededMessageWithReport;

  /// No description provided for @actionDone.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get actionDone;

  /// No description provided for @labelFoods.
  ///
  /// In en, this message translates to:
  /// **'Foods'**
  String get labelFoods;

  /// No description provided for @labelDishes.
  ///
  /// In en, this message translates to:
  /// **'Dishes'**
  String get labelDishes;

  /// No description provided for @labelMeals.
  ///
  /// In en, this message translates to:
  /// **'Meals'**
  String get labelMeals;

  /// No description provided for @labelContainers.
  ///
  /// In en, this message translates to:
  /// **'Containers'**
  String get labelContainers;

  /// No description provided for @labelDefaultNutrients.
  ///
  /// In en, this message translates to:
  /// **'Default Nutrients'**
  String get labelDefaultNutrients;

  /// No description provided for @labelNutrientGoals.
  ///
  /// In en, this message translates to:
  /// **'Nutrient Goals'**
  String get labelNutrientGoals;

  /// No description provided for @labelSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get labelSettings;

  /// No description provided for @importFailedTitle.
  ///
  /// In en, this message translates to:
  /// **'Import failed'**
  String get importFailedTitle;

  /// No description provided for @importFailedMessage.
  ///
  /// In en, this message translates to:
  /// **'The import did not complete successfully.\nSome data may have already been applied to your account, and your account data may now be incomplete.'**
  String get importFailedMessage;

  /// No description provided for @actionRetryImport.
  ///
  /// In en, this message translates to:
  /// **'Retry import'**
  String get actionRetryImport;

  /// No description provided for @messageRetryImportConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Erase your current account data and restart the import?'**
  String get messageRetryImportConfirmation;

  /// No description provided for @actionRevertImport.
  ///
  /// In en, this message translates to:
  /// **'Reset account data'**
  String get actionRevertImport;

  /// No description provided for @messageRevertImportConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Erase your current account data?'**
  String get messageRevertImportConfirmation;

  /// No description provided for @actionIgnoreImport.
  ///
  /// In en, this message translates to:
  /// **'Keep current data'**
  String get actionIgnoreImport;

  /// No description provided for @messageIgnoreImportConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Ignore the import and continue using the app as-is?'**
  String get messageIgnoreImportConfirmation;
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
      <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
