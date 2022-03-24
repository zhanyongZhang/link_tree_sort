//
//  Tool.m
//  LinkList
//
//  Created by 张占勇 on 2022/3/23.
//

#import "Tool.h"

@implementation Tool

+ (NSString *)filePath:(NSString *)fileName {
    NSString *filepath = [[NSBundle mainBundle] pathForResource:fileName ofType:@""];
    return filepath;
}
+ (NSString *)getContentOfpath:(NSString *)filePath {
    
    NSFileManager *manger = [NSFileManager defaultManager];
    NSData *data = [manger contentsAtPath:filePath];
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}
+ (NSString *)getContentOfname:(NSString *)fileName {
    return [self getContentOfpath:[self filePath:fileName]];
}
@end
