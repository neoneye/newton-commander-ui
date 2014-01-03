//
// NCMoveOperationProtocol.h
// Newton Commander
//

#import <Cocoa/Cocoa.h>

@protocol NCMoveOperationDelegate;

@protocol NCMoveOperationProtocol <NSObject>

-(void)setMoveOperationDelegate:(id<NCMoveOperationDelegate>)delegate;

-(void)setMoveOperationNames:(NSArray*)names;
-(void)setMoveOperationSourceDir:(NSString*)fromDir;
-(void)setMoveOperationTargetDir:(NSString*)toDir;

-(void)prepareMoveOperation;
-(void)executeMoveOperation;
-(void)abortMoveOperation;

@end

#pragma mark -

@protocol NCMoveOperationDelegate <NSObject>

-(void)moveOperation:(id<NCMoveOperationProtocol>)move_operation response:(NSDictionary*)dict;

@end
