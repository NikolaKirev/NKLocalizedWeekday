NKLocalizedWeekday
==================

NSDate category for using localized weekday strings. The localized strings depend on the `Region format` user setting.

##Usage##

1. Add `NSDate+NKLocalizedWeekday.h` and `NSDate+NKLocalizedWeekday.m` to your project.
2. Import `NSDate+NKLocalizedWeekday.h`:
```obj-c
#import "NSDate+NKLocalizedWeekday.h"
```

##Methods##

####Useful helper class methods####
```obj-c
+ (NSDate *)addDays:(NSInteger)days toDate:(NSDate *)originalDate;
+ (NSInteger)daysBetweenDate:(NSDate*)fromDateTime andDate:(NSDate*)toDateTime;
```
####Class methods for getting a localized wekkday string for a given day####
#####Keep in mind: Weekdays start from Sunday(hey also start at index 1)#####
+ Sunday - 1
+ Monday - 2
+ Tuesday - 3
+ Wednesday - 4
+ Thursday - 5
+ Friday - 6
+ Saturday - 7

```obj-c
+ (NSString *)veryShortLocalizedWeekdayStringForWeekday:(int)weekday;
+ (NSString *)shortLocalizedWeekdayStringForWeekday:(int)weekday;
+ (NSString *)fullLocalizedWeekdayStringForWeekday:(int)weekday;
```

####Instance methods used for a particular NDDate object####
```obj-c
- (NSString *)veryShorttWeekdayString;
- (NSString *)shortWeekdayString;
- (NSString *)weekdayString;
- (NSString *)weekdayStringFormattingRecentDaysWithYesterdayLocalizedIdentifier:(NSString *)yesterday
                                                    andTodayLocalizedIdentifier:(NSString *)today;
```
##License##
The code is licensed under the standard MIT license.
