//
// NSImage+BundleExtensions.h
// Newton Commander
//

#import <Cocoa/Cocoa.h>


@interface NSImage (NCImageNamedForClass)

+(NSImage*)imageNamed:(NSString*)name forClass:(Class)aClass;

@end
