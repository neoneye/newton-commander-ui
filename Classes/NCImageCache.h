//
// NCImageCache.h
// Newton Commander
//

#import <Cocoa/Cocoa.h>


@interface NCImageCache : NSObject {
	NSMutableDictionary* m_dict;
}
@property (strong) NSMutableDictionary* dict;

-(NSImage*)imageForTag:(int)tag;
-(void)setImage:(NSImage*)image forTag:(int)tag;

@end
