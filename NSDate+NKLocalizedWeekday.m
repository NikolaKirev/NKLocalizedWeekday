//
//  NSDate+NKLocalizedWeekday.m
//
//  Created by Nikola Kirev on 3/27/13.
//  Copyright (c) 2013 Nikola Kirev. All rights reserved.
//

typedef NS_ENUM(NSUInteger, NKLocalizedWeekdayMode) {
    kNKLocalizedWeekdayModeVeryShort,
    kNKLocalizedWeekdayModeShort,
    kNKLocalizedWeekdayModeFull
};

#import "NSDate+NKLocalizedWeekday.h"

@implementation NSDate (NKLocalizedWeekday)

#pragma mark - Class Methods

+ (NSString *)veryShortLocalizedWeekdayStringForWeekday:(int)weekday {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    return [formatter veryShortWeekdaySymbols][weekday - 1];
}

+ (NSString *)shortLocalizedWeekdayStringForWeekday:(int)weekday {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    return [formatter shortWeekdaySymbols][weekday - 1];
}

+ (NSString *)fullLocalizedWeekdayStringForWeekday:(int)weekday {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    return [formatter weekdaySymbols][weekday - 1];
}

#pragma mark - Instance Methods

- (NSString *)veryShorttWeekdayString {
    return [self internalWeekdayStringForMode:kNKLocalizedWeekdayModeVeryShort];
}

- (NSString *)shortWeekdayString {
        return [self internalWeekdayStringForMode:kNKLocalizedWeekdayModeShort];
}

- (NSString *)weekdayString {
        return [self internalWeekdayStringForMode:kNKLocalizedWeekdayModeFull];
}

- (NSString *)weekdayStringFormattingRecentDaysWithYesterdayLocalizedIdentifier:(NSString *)yesterday
                                                    andTodayLocalizedIdentifier:(NSString *)today {
    NSString *dateString = @"";
    NSDate *now = [NSDate date];
    NSInteger interval = [NSDate daysBetweenDate:self andDate:now];
    if (interval == 0) {
        dateString = NSLocalizedString(today, nil);
    }else if (interval == 1) {
        dateString = NSLocalizedString(yesterday, nil);
    }else {
        return [self weekdayString];
    }
    return dateString;
}

#pragma mark - Helper Methods

+ (NSDate *)addDays:(NSInteger)days toDate:(NSDate *)originalDate {
    NSDateComponents *components= [[NSDateComponents alloc] init];
    [components setDay:days];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    return [calendar dateByAddingComponents:components toDate:originalDate options:0];
}

+ (NSInteger)daysBetweenDate:(NSDate*)fromDateTime andDate:(NSDate*)toDateTime {
    NSDate *fromDate;
    NSDate *toDate;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    [calendar rangeOfUnit:NSDayCalendarUnit startDate:&fromDate
                 interval:NULL forDate:fromDateTime];
    [calendar rangeOfUnit:NSDayCalendarUnit startDate:&toDate
                 interval:NULL forDate:toDateTime];
    NSDateComponents *differenceComponents = [calendar components:NSDayCalendarUnit
                                                         fromDate:fromDate
                                                           toDate:toDate
                                                          options:0];
    return [differenceComponents day];
}

#pragma mark - Internal Methods

- (NSString *)internalWeekdayStringForMode:(NKLocalizedWeekdayMode)mode {
    NSString *weekdayString = @"";
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSWeekdayCalendarUnit fromDate:self];
    int weekdayNumber = [components weekday];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    switch (mode) {
        case kNKLocalizedWeekdayModeVeryShort:
            weekdayString = [[formatter veryShortWeekdaySymbols] objectAtIndex:weekdayNumber - 1];
            break;
        case kNKLocalizedWeekdayModeShort:
            weekdayString = [[formatter shortWeekdaySymbols] objectAtIndex:weekdayNumber - 1];
            break;
        case kNKLocalizedWeekdayModeFull:
            weekdayString = [[formatter weekdaySymbols] objectAtIndex:weekdayNumber - 1];
            break;
        default:
            weekdayString = [[formatter weekdaySymbols] objectAtIndex:weekdayNumber - 1];
            break;
    }
    return weekdayString;
}

@end
