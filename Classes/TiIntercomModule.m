/**
 * Your Copyright Here
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
#import "TiIntercomModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"
#import "Intercom.h"

bool loggingEnabled = NO;

@implementation TiIntercomModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
    return @"a66b3b9a-7d87-44c5-a04e-d10d05a9f7d2";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
    return @"ti.intercom";
}

#pragma mark Lifecycle

-(void)startup
{
    // this method is called when the module is first loaded
    // you *must* call the superclass
    [super startup];
}

-(void)shutdown:(id)sender
{
    // this method is called when the module is being unloaded
    // typically this is during shutdown. make sure you don't do too
    // much processing here or the app will be quit forceably

    // you *must* call the superclass
    [super shutdown:sender];
}

#pragma mark Cleanup

-(void)dealloc
{
    // release any resources that have been retained by the module
    [super dealloc];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
    // optionally release any resources that can be dynamically
    // reloaded once memory is available - such as caches
    [super didReceiveMemoryWarning:notification];
}

#pragma mark Listener Notifications

-(void)_listenerAdded:(NSString *)type count:(int)count
{
    if (count == 1 && [type isEqualToString:@"my_event"])
    {
        // the first (of potentially many) listener is being added
        // for event named 'my_event'
    }
}

-(void)_listenerRemoved:(NSString *)type count:(int)count
{
    if (count == 0 && [type isEqualToString:@"my_event"])
    {
        // the last listener called for event named 'my_event' has
        // been removed, we can optionally clean up any resources
        // since no body is listening at this point for that event
    }
}

#pragma Public APIs

-(void)initialize:(id)args
{
    ENSURE_UI_THREAD(initialize, args);
    ENSURE_SINGLE_ARG(args, NSDictionary);

    [Intercom setApiKey:[args objectForKey:@"api_key"] forAppId:[args objectForKey:@"app_id"]];

    if([args objectForKey:@"loggingEnabled"]) {
        [self loggingEnabled:@""];
    }

    if([args objectForKey:@"requiresDisplayOffset"]) {
        [self requiresDisplayOffset:@""];
    }

    if(loggingEnabled) NSLog(@"[DEBUG] Loaded Intercom SDK");
}

-(void)beginSessionForUserWithEmail:(id)email
{
    ENSURE_SINGLE_ARG(email, NSString);

    [Intercom beginSessionForUserWithEmail:email];

    if(loggingEnabled) NSLog(@"[DEBUG] Starting Intercom session with email for %@", email);
}

-(void)beginSessionForUserWithUserId:(id)userId
{
    ENSURE_SINGLE_ARG(userId, NSString);

    [Intercom beginSessionForUserWithUserId:userId];

    if(loggingEnabled) NSLog(@"[DEBUG] Starting Intercom session with userId %@", userId);
}

-(void)beginSessionForUserWithUserIdandEmail:(id)args
{
    ENSURE_SINGLE_ARG(args, NSDictionary);

    [Intercom beginSessionForUserWithUserId:[args objectForKey:@"user_id"] andEmail:[args objectForKey:@"email"]];

    if(loggingEnabled) NSLog(@"[DEBUG] Starting Intercom session with userId %@ and email %@", [args objectForKey:@"user_id"], [args objectForKey:@"email"]);
}

-(void)endSession:(id)args
{
    [Intercom endSession];

    if(loggingEnabled) NSLog(@"[DEBUG] Ending Intercom session");
}

-(void)loggingEnabled:(id)args
{
    ENSURE_UI_THREAD_0_ARGS;

    [Intercom loggingEnabled:YES];
    loggingEnabled = YES;

    if(loggingEnabled) NSLog(@"[DEBUG] Intercom logging enabled");
}

-(void)requiresDisplayOffset:(id)args
{
    ENSURE_UI_THREAD_0_ARGS;

    [Intercom requiresDisplayOffset:YES];

    if(loggingEnabled) NSLog(@"[DEBUG] Intercom display offset enabled");
}

-(BOOL)sessionIsActive:(id)args
{
    return [Intercom sessionIsActive];
}

-(void)incrementAttribute:(id)attribute
{
    ENSURE_SINGLE_ARG(attribute, NSString);

    [Intercom incrementAttribute:attribute];

    if(loggingEnabled) NSLog(@"[DEBUG] Incrementing attribute %@", attribute);
}

-(void)showNewMessageComposerWithTitleColor:(id)args
{
    ENSURE_UI_THREAD(showNewMessageComposerWithTitleColor, args);
    ENSURE_SINGLE_ARG(args, NSDictionary);

    [Intercom showNewMessageComposerWithTitleColor:[[TiUtils colorValue:[args objectForKey:@"title_color"]] _color] barColor:[[TiUtils colorValue:[args objectForKey:@"bar_color"]] _color] keyboardAppearance:[args objectForKey:@"keyboard_appearance"] success:^(id responseObject) {
        [Intercom closeNewMessageComposer];
    } failure:^(NSError *error) {
        NSLog(@"Failure is %@", error.localizedDescription);
    }];

    if(loggingEnabled) NSLog(@"[DEBUG] Opening composer");
}

-(void)updateAttributes:(id)attributes
{
    ENSURE_SINGLE_ARG(attributes, NSDictionary);

    [Intercom updateAttributes:attributes];

    if(loggingEnabled) NSLog(@"[DEBUG] Updating attributes %@", attributes);
}

-(void)updateUserName:(id)name
{
    ENSURE_SINGLE_ARG(name, NSString);

    [Intercom updateUserName:name];

    if(loggingEnabled) NSLog(@"[DEBUG] Updating username to %@", name);
}

@end