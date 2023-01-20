//
//  LanguageManager.h
//  ios_language_manager
//
//  Created by Maxim Bilan on 12/23/14.
//  Copyright (c) 2014 Maxim Bilan. All rights reserved.
//

#import <Foundation/Foundation.h>

#define LANG_EN @"en"
#define LANG_DE @"de"
#define LANG_FR @"fr"
#define LANG_AR @"ar"

typedef NS_ENUM(NSInteger, ELanguage)
{
    ELanguageEnglish,
    ELanguageGerman,
    ELanguageFrench,
	ELanguageArabic,
	
    ELanguageCount
};

@interface LanguageManager : NSObject

+ (void)setupCurrentLanguage;
+ (NSArray *)languageStrings;
+ (NSString *)currentLanguageString;
+ (NSString *)currentLanguageCode;
+ (NSInteger)currentLanguageIndex;
+ (void)saveLanguageByIndex:(NSInteger)index;
+ (void)saveLanguageByCode:(NSString*)code;
+ (BOOL)isCurrentLanguageRTL;

@end
