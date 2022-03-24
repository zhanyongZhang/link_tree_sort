//
//  DNode.h
//  LinkList
//
//  Created by 张占勇 on 2022/3/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DNode : NSObject
@property (nonatomic, strong) NSMutableDictionary *chiren;
@property (nonatomic, assign) BOOL isWords;
@property (nonatomic, strong) NSString * __nullable value;
@property (nonatomic, strong) NSString *charS;
@property (nonatomic, strong) DNode *parent;
+ (DNode *)node:(NSString * __nullable)value isWord:(BOOL)isWords chiren:(NSMutableDictionary *)chiren;
@end

NS_ASSUME_NONNULL_END
