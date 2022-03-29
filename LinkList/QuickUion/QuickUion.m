//
//  QuickUion.m
//  LinkList
//
//  Created by 张占勇 on 2022/3/28.
//

#import "QuickUion.h"

@interface QuickUion ()
@property (nonatomic,strong)NSMutableArray *parents;
@property (nonatomic,strong)NSMutableArray *sizes;
@end

@implementation QuickUion
- (instancetype)initWith:(NSArray *)elements {
    
    if([super init]) {
        self.parents = [NSMutableArray array];
        self.sizes = [NSMutableArray array];
        for(NSInteger i = 0;i < elements.count; i++) {
            NSString *value = elements[i];
            self.parents[[value intValue]] = [NSString stringWithFormat:@"%@",value];
            self.sizes[[value intValue]] = @(1);
        }
    }
    return self;
}
- (NSString *)find:(NSString *)value {
    
    NSString *p = self.parents[[value intValue]];
    while (![p isEqualToString:self.parents[[p intValue]]]) {
        p = self.parents[[p intValue]];
    }
    return p;
}
- (void)uion:(NSString *)one other:(NSString *)other {
    
    NSString *p1 = [self find:one];
    NSString *p2 = [self find:other];
    if ([p1 isEqualToString:p2]) return;
    NSInteger s1 = [self.sizes[[p1 intValue]] integerValue];
    NSInteger s2 = [self.sizes[[p2 intValue]] integerValue];
    if (s1 < s2){
        self.parents[[p1 intValue]] = p2;
        self.sizes[[p2 intValue]] = @(s1 + s2);
    } else {
        self.parents[[p2 intValue]] = p1;
        self.sizes[[p1 intValue]] = @(s1 + s2);
    }
}
@end
