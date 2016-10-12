//
//  Use this file to import your target's public headers that you would like to expose to Swift.
//

#import <Foundation/Foundation.h>
#import <SafariServices/SafariServices.h>

@interface OABGestaltFixer : NSObject
+ (void)fixGestalt;
@end

@interface NSExtension : NSObject
@end

@interface NSExtension (OpenAdBlock)
	@property (nonatomic, copy) NSString *identifier;
@end

@interface SFContentBlockerManager (OpenAdBlock)
+ (SFContentBlockerManager*)sharedManager;
- (void)_beginContentBlockerDiscovery;
- (void)_loadContentBlockerWithIdentifier:(NSString *)arg1 completionHandler:(void(^)(NSError *))arg2;
- (BOOL)extensionIsEnabled:(NSExtension *)arg1;
- (void)setExtension:(NSExtension *)arg1 isEnabled:(BOOL)arg2;
- (NSArray*)extensions;
@end
