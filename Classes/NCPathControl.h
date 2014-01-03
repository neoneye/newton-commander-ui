//
// NCPathControl.h
// Newton Commander
//

#import <Cocoa/Cocoa.h>


@interface NCPathControl : NSPathControl {
	NSString* m_path;
	BOOL m_active;
}
@property (nonatomic, strong) NSString* path;

-(void)rebuild;

-(void)activate;
-(void)deactivate;

@end


@interface NCPathCell : NSPathCell {
}
@end


@interface NCPathComponentCell : NSPathComponentCell {
	BOOL m_active;
	BOOL m_first;
	BOOL m_last;
}

-(BOOL)isActive;
-(void)setActive:(BOOL)value;

-(BOOL)isFirst;
-(void)setFirst:(BOOL)value;

-(BOOL)isLast;
-(void)setLast:(BOOL)value;

@end

