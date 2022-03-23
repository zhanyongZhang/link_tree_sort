//
//  Insert.m
//  LinkList
//
//  Created by 张占勇 on 2022/3/22.
//

#import "Insert.h"

@interface Insert ()
@property (nonatomic, strong) NSMutableArray *elments;
@end

@implementation Insert

- (id)sortWith:(NSArray *)data {
    if([super init]) {
        self.elments = [NSMutableArray arrayWithArray:data];
    }
    return self;
}
- (void)sort {
    for(NSInteger index = 1; index < self.elments.count; index++){
        [self insert:index det:[self search:index]];
    }
}
- (void)insert:(NSInteger)orgin det:(NSInteger)det {
    NSNumber *value = self.elments[orgin];
    for(NSInteger end = orgin; end > det; end --){
        self.elments[end] = self.elments[end -1];
    }
    self.elments[det] = value;
}
- (NSInteger)search:(NSInteger)index {
    NSInteger begin = 0;
    NSInteger end = index;
    NSNumber *value = self.elments[index];
    while (begin < end) {
        NSInteger mid = (begin + end) >> 1;
        if([self.elments[mid] intValue] > [value intValue]) {
            end = mid;
        }else{
            begin = mid + 1;
        }
    }
    return end;
}
-(NSString *)description {
    NSMutableString *des = [NSMutableString string];
    for (NSNumber *num in self.elments) {
        [des appendFormat:@"%@",num];
        [des appendFormat:@"%s"," "];
    }
    return des;
}
@end
