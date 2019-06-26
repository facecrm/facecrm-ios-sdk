#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FaceLib : NSObject
+ (NSMutableArray *)detect:(UIImage *)source rect:(NSMutableArray *)rectArray;
@end
