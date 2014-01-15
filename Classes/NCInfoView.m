//
// NCInfoView.m
// Newton Commander
//
#if ! __has_feature(objc_arc)
#error This file must be compiled with ARC. Use -fobjc-arc flag (or convert project to ARC).
#endif


#import "NCLog.h"
#import "NCInfoView.h"
#import "NSBundle+NewtonCommanderUIBundle.h"
#import "NCInspectFile.h"


@interface NCInfoView ()
@property (nonatomic, strong) NSTextView *textView;
@end

@implementation NCInfoView

-(void)setupStuff {
	
	// Setting up the scroll view
	NSScrollView *scrollview = [[NSScrollView alloc] initWithFrame:[self bounds]];
	NSSize contentSize = [scrollview contentSize];
	[scrollview setBorderType:NSNoBorder];
	[scrollview setHasVerticalScroller:YES];
	[scrollview setHasHorizontalScroller:NO];
	[scrollview setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
	
	// Setting up the text view
	NSTextView *theTextView = [[NSTextView alloc] initWithFrame:NSMakeRect(0, 0, contentSize.width, contentSize.height)];
	[theTextView setMinSize:NSMakeSize(0.0, contentSize.height)];
	[theTextView setMaxSize:NSMakeSize(FLT_MAX, FLT_MAX)];
	[theTextView setVerticallyResizable:YES];
	[theTextView setHorizontallyResizable:NO];
	[theTextView setAutoresizingMask:NSViewWidthSizable];
	[[theTextView textContainer] setContainerSize:NSMakeSize(contentSize.width, FLT_MAX)];
	[[theTextView textContainer] setWidthTracksTextView:YES];
	
	// Assembling the pieces
	[scrollview setDocumentView:theTextView];
	
	
	[self addSubview:scrollview];
	self.textView = theTextView;
	self.textView.string = @"Empty";
}

-(void)demo {
	[self analyzePath:[@"~/Desktop" stringByExpandingTildeInPath]];
}

-(void)analyzePath:(NSString*)path {
	NSParameterAssert(path);
	NCInspectFile *pp = [[NCInspectFile alloc] initWithPath:path];
	[pp obtain];
	NSAttributedString *s = [pp result];
	[self.textView setEditable:YES];
	self.textView.string = @"";
	[self.textView insertText:s];
	[self.textView setEditable:NO];
}

- (void)awakeFromNib
{
	
	[self setupStuff];
}



//
//	Don't draw background
//
- (BOOL)drawsBackground
{
	return	NO;
}

@end
