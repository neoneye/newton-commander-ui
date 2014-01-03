//
// NCVolumeStatus.h
// Newton Commander
//

#import <Cocoa/Cocoa.h>


@interface NCVolumeStatus : NSView {
	BOOL _active;
	unsigned long long _capacity;
	unsigned long long _available;
}
@property (nonatomic) unsigned long long capacity;
@property (nonatomic) unsigned long long available;

-(void)activate;
-(void)deactivate;

@end
