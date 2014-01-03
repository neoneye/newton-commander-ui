//
// NCCopyOperationProtocol.h
// Newton Commander
//

#import <Cocoa/Cocoa.h>

@protocol NCCopyOperationDelegate;

@protocol NCCopyOperationProtocol <NSObject>

-(void)setCopyOperationDelegate:(id<NCCopyOperationDelegate>)delegate;

-(void)setCopyOperationNames:(NSArray*)names;
-(void)setCopyOperationSourceDir:(NSString*)fromDir;
-(void)setCopyOperationTargetDir:(NSString*)toDir;

-(void)prepareCopyOperation;
-(void)executeCopyOperation;
-(void)abortCopyOperation;

@end

#pragma mark -

@protocol NCCopyOperationDelegate <NSObject>

-(void)copyOperation:(id<NCCopyOperationProtocol>)copy_operation response:(NSDictionary*)dict;

@end
