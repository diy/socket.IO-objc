//
//  SocketIOJSONSerialization.m
//  v0.3.3 ARC
//
//  based on
//  socketio-cocoa https://github.com/fpotter/socketio-cocoa
//  by Fred Potter <fpotter@pieceable.com>
//
//  using
//  https://github.com/square/SocketRocket
//  https://github.com/stig/json-framework/
//
//  reusing some parts of
//  /socket.io/socket.io.js
//
//  Created by Philipp Kyeck http://beta-interactive.de
//
//  Updated by
//    samlown   https://github.com/samlown
//    kayleg    https://github.com/kayleg
//    taiyangc  https://github.com/taiyangc
//

#import "SocketIOJSONSerialization.h"

extern NSString * const SocketIOException;

// covers the methods in SBJson and JSONKit
@interface NSObject (SocketIOJSONSerialization)

// used by both JSONKit and SBJson
- (id) objectWithData:(NSData *)data;

// Use by JSONKit serialization
- (NSString *) JSONString;
- (id) decoder;

// Used by SBJsonWriter
- (NSString *) stringWithObject:(id)object;

@end

@implementation SocketIOJSONSerialization

+ (id) objectFromJSONData:(NSData *)data error:(NSError **)error {
    return [NSJSONSerialization JSONObjectWithData:data options:0 error:error];
}

+ (NSString *) JSONStringFromObject:(id)object error:(NSError **)error {
    Class     serializer;
    NSString *jsonString;
    
    jsonString = nil;
    
    serializer = NSClassFromString(@"NSJSONSerialization");
    if (serializer) {
        NSData *data;
        
        data = [serializer dataWithJSONObject:object options:0 error:error];
        
        jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        
        return jsonString;
    }
    
    return nil;
}

@end
