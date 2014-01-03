//
// NCInfoView.h
// Newton Commander
//

#import <Cocoa/Cocoa.h>
#import <Webkit/Webkit.h>

@interface NCInfoObject : NSObject {

	NSString*	name;
	NSString*	orientation;
	float		x, y;
}

@property (copy) NSString* name;
@property (copy) NSString* orientation;
@property float x, y;

@end


@interface NCInfoView : WebView {
	NSMutableArray*	bindingNames;
	NSMutableArray*	bindingObservedObjects;
	NSMutableArray*	bindingObservedKeyPaths;

	NSString*	filename;
	float		angle;
	
	NCInfoObject* m_info;
	NSObjectController* m_controller;
}

@property (copy) NSString* filename;
@property	float angle;

@end
