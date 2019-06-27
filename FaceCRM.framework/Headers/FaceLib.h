#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FaceLib : NSObject
+ (UIImage *)rotate:(UIImage *)source;
+ (NSMutableArray *)detect:(UIImage *)source rect:(NSMutableArray *)rectArray;
@end
