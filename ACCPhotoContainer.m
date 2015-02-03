#import "ACCPhotoContainer.h"

@interface ACCPhotoContainer ()

// Private interface goes here.

@end

@implementation ACCPhotoContainer

-(UIImage*)image{
    
    return [UIImage imageWithData:self.photoData];
}

-(void) setImage:(UIImage *)image{
    
    UIImageJPEGRepresentation(image, 0.9);
}

@end
