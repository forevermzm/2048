//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 hamcrest.org. See LICENSE.txt

#import <OCHamcrestIOS/HCBaseMatcher.h>


@interface HCIsCloseTo : HCBaseMatcher

+ (instancetype)isCloseTo:(double)value within:(double)delta;
- (instancetype)initWithValue:(double)value delta:(double)delta;

@end


FOUNDATION_EXPORT id HC_closeTo(double aValue, double aDelta);

#ifdef HC_SHORTHAND
/*!
 * @brief closeTo(aValue, aDelta) -
 * Matches if object is a number close to a given value, within a given delta.
 * @param aValue The double value to compare against as the expected value.
 * @param aDelta The double maximum delta between the values for which the numbers are considered close.
 * @discussion This matcher invokes <code>-doubleValue</code> on the evaluated object to get its
 * value as a double. The result is compared against <em>aValue</em> to see if the difference is
 * within a positive <em>aDelta</em>.
 *
 * Example:
 * <ul>
 *   <li><code>closeTo(3.0, 0.25)</code></li>
 * </ul>
 *
 * @attribute Name Clash
 * In the event of a name clash, don't <code>#define HC_SHORTHAND</code> and use the synonym
 * HC_closeTo instead.
 */
#define closeTo HC_closeTo
#endif
