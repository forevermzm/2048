//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 hamcrest.org. See LICENSE.txt

#import <OCHamcrestIOS/HCBaseMatcher.h>


@interface HCSubstringMatcher : HCBaseMatcher

@property (nonatomic, copy, readonly) NSString *substring;

- (instancetype)initWithSubstring:(NSString *)aString;

@end
