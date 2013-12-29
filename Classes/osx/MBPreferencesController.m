/*
 Copyright (c) 2008 Matthew Ball - http://www.mattballdesign.com
 
 Permission is hereby granted, free of charge, to any person
 obtaining a copy of this software and associated documentation
 files (the "Software"), to deal in the Software without
 restriction, including without limitation the rights to use,
 copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the
 Software is furnished to do so, subject to the following
 conditions:
 
 The above copyright notice and this permission notice shall be
 included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 OTHER DEALINGS IN THE SOFTWARE.
 */
#if ! __has_feature(objc_arc)
#error This file must be compiled with ARC. Use -fobjc-arc flag (or convert project to ARC).
#endif


#import "MBPreferencesController.h"

NSString *MBPreferencesSelectionAutosaveKey = @"MBPreferencesSelection";

@interface MBPreferencesController (Private)
- (void)_setupToolbar;
- (void)_selectModule:(NSToolbarItem *)sender;
@end

@implementation MBPreferencesController

#pragma mark -
#pragma mark Property Synthesis

@synthesize modules=_modules;

#pragma mark -
#pragma mark Life Cycle

- (id)init
{
	if (self = [super init]) {
		NSPanel *prefsWindow = [[NSPanel alloc] initWithContentRect:NSMakeRect(0, 0, 300, 200) styleMask:(NSTitledWindowMask | NSClosableWindowMask) backing:NSBackingStoreBuffered defer:YES];
		[prefsWindow setShowsToolbarButton:NO];
		[prefsWindow setHidesOnDeactivate:NO];
		self.window = prefsWindow;
		
		[self _setupToolbar];
	}
	return self;
}

- (void)dealloc
{
	self.modules = nil;
}

+ (MBPreferencesController *)sharedController {
    /*
     this method is implemented accordingly to:
     http://stackoverflow.com/questions/7568935/how-do-i-implement-an-objective-c-singleton-that-is-compatible-with-arc
     */
    static MBPreferencesController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // Do any other initialisation stuff here
        sharedInstance = [MBPreferencesController new];
    });
    return sharedInstance;
}


#pragma mark -
#pragma mark NSWindowController Subclass

- (void)showWindow:(id)sender
{
	[self.window center];
	[super showWindow:sender];
}

#pragma mark -
#pragma mark NSToolbar

- (void)_setupToolbar
{
	NSToolbar *toolbar = [[NSToolbar alloc] initWithIdentifier:@"PreferencesToolbar"];
	[toolbar setDisplayMode:NSToolbarDisplayModeIconAndLabel];
	[toolbar setAllowsUserCustomization:NO];
	[toolbar setDelegate:self];
	[toolbar setAutosavesConfiguration:NO];
	[self.window setToolbar:toolbar];
}

- (NSArray *)toolbarAllowedItemIdentifiers:(NSToolbar *)toolbar
{
	NSMutableArray *identifiers = [NSMutableArray array];
	for (id<MBPreferencesModule> module in self.modules) {
		[identifiers addObject:[module identifier]];
	}
	
	return identifiers;
}

- (NSArray *)toolbarDefaultItemIdentifiers:(NSToolbar *)toolbar
{
	// We start off with no items. 
	// Add them when we set the modules
	return nil;
}

- (NSToolbarItem *)toolbar:(NSToolbar *)toolbar itemForItemIdentifier:(NSString *)itemIdentifier willBeInsertedIntoToolbar:(BOOL)flag
{
	id<MBPreferencesModule> module = [self moduleForIdentifier:itemIdentifier];
	
	NSToolbarItem *item = [[NSToolbarItem alloc] initWithItemIdentifier:itemIdentifier];
	if (!module)
		return item;
	
	
	[item setLabel:[module title]];
	[item setImage:[module image]];
	[item setTarget:self];
	[item setAction:@selector(_selectModule:)];
	return item;
}

- (NSArray *)toolbarSelectableItemIdentifiers:(NSToolbar *)toolbar
{
	return [self toolbarAllowedItemIdentifiers:toolbar];
}

#pragma mark -
#pragma mark Modules

- (id<MBPreferencesModule>)moduleForIdentifier:(NSString *)identifier
{
	for (id<MBPreferencesModule> module in self.modules) {
		if ([[module identifier] isEqualToString:identifier]) {
			return module;
		}
	}
	return nil;
}

- (void)setModules:(NSArray *)newModules
{
	if (_modules) {
		_modules = nil;
	}
	
	if (newModules != _modules) {
		_modules = newModules;
		
		// Reset the toolbar items
		NSToolbar *toolbar = [self.window toolbar];
		if (toolbar) {
			NSInteger index = [[toolbar items] count]-1;
			while (index > 0) {
				[toolbar removeItemAtIndex:index];
				index--;
			}
			
			// Add the new items
			for (id<MBPreferencesModule> module in self.modules) {
				[toolbar insertItemWithItemIdentifier:[module identifier] atIndex:[[toolbar items] count]];
			}
		}
		
		// Change to the correct module
		if ([self.modules count]) {
			id<MBPreferencesModule> defaultModule = nil;
			
			// Check the autosave info
			NSString *savedIdentifier = [[NSUserDefaults standardUserDefaults] stringForKey:MBPreferencesSelectionAutosaveKey];
			defaultModule = [self moduleForIdentifier:savedIdentifier];
			
			if (!defaultModule) {
				defaultModule = [self.modules objectAtIndex:0];
			}
			
			[self changeToModule:defaultModule animate:YES];
		}
		
	}
}

- (void)_selectModule:(NSToolbarItem *)sender
{
	if (![sender isKindOfClass:[NSToolbarItem class]])
		return;
	
	id<MBPreferencesModule> module = [self moduleForIdentifier:[sender itemIdentifier]];
	if (!module)
		return;
	
	[self changeToModule:module animate:YES];
}

- (void)changeToModule:(id<MBPreferencesModule>)module animate:(BOOL)animate
{
	if(module == nil) return;
	
	[[_currentModule view] removeFromSuperview];
	
	NSView *newView = [module view];
	
	// Resize the window
	NSRect newWindowFrame = [self.window frameRectForContentRect:[newView frame]];
	newWindowFrame.origin = [self.window frame].origin;
	newWindowFrame.origin.y -= newWindowFrame.size.height - [self.window frame].size.height;
	[self.window setFrame:newWindowFrame display:YES animate:animate];
	
	[[self.window toolbar] setSelectedItemIdentifier:[module identifier]];
	[self.window setTitle:[module title]];
	
	if ([(NSObject *)module respondsToSelector:@selector(willBeDisplayed)]) {
		[module willBeDisplayed];
	}
	
	_currentModule = module;
	[[self.window contentView] addSubview:[_currentModule view]];
	
	// Autosave the selection
	[[NSUserDefaults standardUserDefaults] setObject:[module identifier] forKey:MBPreferencesSelectionAutosaveKey];
}

@end
