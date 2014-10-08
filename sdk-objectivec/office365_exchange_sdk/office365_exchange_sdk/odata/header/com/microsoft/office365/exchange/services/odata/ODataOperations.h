#import "ODataExecutable.h"
#import <office365_odata_interfaces/DependencyResolver.h>

@interface ODataOperations : ODataExecutable

-(id)initOperationWith : (NSString*) urlComponent : (ODataExecutable*) parent;

@end
