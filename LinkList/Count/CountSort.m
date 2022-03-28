//
//  CountSort.m
//  LinkList
//
//  Created by 张占勇 on 2022/3/28.
//

#import "CountSort.h"

@interface CountSort ()
@property (nonatomic, strong) NSMutableArray *dataArr;
@property (nonatomic, strong) NSMutableArray *counts;
@end

@implementation CountSort

- (CountSort *)sortWith:(NSArray *)data {
    if([super init]) {
        
        self.dataArr = [NSMutableArray arrayWithArray:data];
        self.counts = [NSMutableArray array];
        [self sort];
    }
    return self;
}
// 8 7 6 2 3 5 8
- (void)sort {
    
    NSInteger max = 0;
    for (NSInteger i = 0; i <  self.dataArr.count; i++) {
        NSNumber *value = self.dataArr[i];
        if ([value integerValue] > max) {
            max = [value integerValue];
        }
    }
    for (NSInteger i = 0; i < max + 1; i++) {
        [self.counts addObject:@(0)];
    }
    
    for (NSInteger i = 0; i < self.dataArr.count; i++) {
        NSNumber *value = self.dataArr[i];
        NSNumber *cValue = self.counts[[value integerValue]];
        [self.counts replaceObjectAtIndex:[value integerValue] withObject:@([cValue intValue] +1)];
    }
    NSInteger index = self.dataArr.count - 1;
    for (NSInteger i = self.counts.count - 1; i >= 0; i--) {
        NSInteger count = [self.counts[i] intValue];
        while (count > 0) {
            self.dataArr[index--] = @(i);
            --count;
        }
    }
}
-(NSString *)description {
    NSMutableString *des = [NSMutableString string];
    for (NSNumber *num in self.dataArr) {
        [des appendFormat:@"%@",num];
        [des appendFormat:@"%s"," "];
    }
    return des;
}
@end
