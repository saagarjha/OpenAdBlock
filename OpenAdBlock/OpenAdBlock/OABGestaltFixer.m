//
//  OABGestaltFixer.m
//  OpenAdBlock
//
//  Created by Saagar Jha on 10/10/16.
//  Copyright © 2016 Saagar Jha. All rights reserved.
//

#import <dlfcn.h>
#import "fishhook.h"
#import <Foundation/Foundation.h>
#import "OpenAdBlock-Bridging-Header.h"

@implementation OABGestaltFixer

static BOOL (*OGGetBoolAnswer)(NSString *question);
static BOOL OABGetBoolAnswer(NSString *question) {
	return [question isEqual:@"s+gaKNe68Gs3PfqKrZhi1w"] ? YES : OGGetBoolAnswer(question);
}

+ (void)fixGestalt {
	OGGetBoolAnswer = dlsym(dlopen("/usr/lib/libMobileGestalt.dylib", RTLD_LAZY), "MGGetBoolAnswer");
	rebind_symbols((struct rebinding[1]) {{"MGGetBoolAnswer", OABGetBoolAnswer}}, 1);
}

@end
