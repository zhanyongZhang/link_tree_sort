//
//  Tool.h
//  LinkList
//
//  Created by 张占勇 on 2022/3/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Tool : NSObject
+(NSString *)filePath:(NSString *)fileName;
+(NSString *)getContentOfpath:(NSString *)filePath;
+(NSString *)getContentOfname:(NSString *)fileName;
@end

NS_ASSUME_NONNULL_END
