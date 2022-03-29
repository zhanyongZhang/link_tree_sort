//
//  QuickFind.m
//  LinkList
//
//  Created by 张占勇 on 2022/3/28.
//

#import "QuickFind.h"

@interface QuickFind ()
@property (nonatomic,strong)NSMutableArray *parents;
@end

@implementation QuickFind
- (instancetype)initWith:(NSArray *)elements {
    if([super init]) {
        self.parents = [NSMutableArray array];
        for(NSInteger i = 0;i < elements.count; i++) {
            NSString *value = elements[i];
            self.parents[[value intValue]] = [NSString stringWithFormat:@"%@",value];
        }
    }
    return self;
}
- (NSString *)find:(NSString *)value {
    
    return self.parents[[value intValue]];
}
- (void)uion:(NSString *)one other:(NSString *)other {
    
    NSString *p1 = self.parents[[one intValue]];
    NSString *p2 = self.parents[[other intValue]];
    if ([p1 isEqualToString:p2]) return;
    self.parents[[one intValue]] = p2;
    for (NSInteger i = 0; i< self.parents.count; i++) {
        NSString *p = self.parents[i];
        if ([p isEqual:p1]){
            self.parents[i] = p2;
        }
    }
}
@end
