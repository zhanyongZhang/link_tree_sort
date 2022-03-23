//
//  Node.h
//  LinkList
//
//  Created by 张占勇 on 2022/3/18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Node : NSObject
@property (nonatomic, strong) NSString *value;
@property (nonatomic, strong) Node * __nullable next;
@property (nonatomic, strong) Node * __nullable prev;
+(Node *)nodeWith:(NSString *)value next:(Node *)next prev:(Node *)prev;
@end

NS_ASSUME_NONNULL_END
