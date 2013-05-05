//
//  NSDate+NKLocalizedWeekday.h
//
//  Created by Nikola Kirev on 3/27/13.
//  Copyright (c) 2013 Nikola Kirev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (NKLocalizedWeekday)

// Useful helper class methods used in this category

/**
 Used to add days to an NSDate object. Works with negative integerts too!
 */
+ (NSDate *)addDays:(NSInteger)days toDate:(NSDate *)originalDate;

/**
 @return Returns the number of days between two dates
 */
+ (NSInteger)daysBetweenDate:(NSDate*)fromDateTime andDate:(NSDate*)toDateTime;

// Class methods for getting a localized wekkday string for a given day.
/*
 Keep in mind: Weekdays start from Sunday
 They also start at index 1
 Sunday - 1
 Monday - 2
 Tuesday - 3
 Wednesday - 4
 Thursday - 5
 Friday - 6
 Saturday - 7
 */
 
/**
 This method returns very short localized strings (1-2) letters for the weekday at the coresponding index.
 
 @param The index for the weekday you want localized string for
 
 @return Returns a localized string for the weekday for the coresponding index
 */
+ (NSString *)veryShortLocalizedWeekdayStringForWeekday:(int)weekday;

/**
 This method returns medium length localized strings for the weekday at the coresponding index.
 
 @param The index for the weekday you want localized string for
 
 @return Returns a localized string for the weekday for the coresponding index
 */
+ (NSString *)shortLocalizedWeekdayStringForWeekday:(int)weekday;

/**
 This method returns a full lenght localized strings for the weekday at the coresponding index.
 
 @param The index for the weekday you want localized string for
 
 @return Returns a localized string for the weekday for the coresponding index
 */
+ (NSString *)fullLocalizedWeekdayStringForWeekday:(int)weekday;

// Instance methods used for a particular NDDate object
/**
 @return Returns a very short (1-2) letter localized weekday string for the reciever NSDate
 */
- (NSString *)veryShorttWeekdayString;

/**
 @return Returns a medium length localized weekday string for the reciever NSDate
 */
- (NSString *)shortWeekdayString;

/**
 @return Returns a full lenght letter localized weekday string for the reciever NSDate
 */
- (NSString *)weekdayString;

/**
 A method that returns the full localized weekday string for a date.
 If the date is for the current day it returns the localized "today" string.
 If the date is for the day before the current day it returns the localized "yesterday" string.
 NOTE: If you do not have localized "today" and "yesterday" it will return the keys.
 
 @param The key for "yesterday" localized string
 
 @param The key for "today" localized string
 
 @return Returns a localized string for the weekday of the NSDate reciever
 
 */
- (NSString *)weekdayStringFormattingRecentDaysWithYesterdayLocalizedIdentifier:(NSString *)yesterday
                                                    andTodayLocalizedIdentifier:(NSString *)today;

@end
