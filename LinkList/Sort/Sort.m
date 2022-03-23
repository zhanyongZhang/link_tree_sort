//
//  Sort.m
//  LinkList
//
//  Created by 张占勇 on 2022/3/21.
//

#import "Sort.h"

@interface Sort ()
@property (nonatomic, strong) NSMutableArray *data;
@end

@implementation Sort

- (id)initWith:(NSArray *)data {
    if(self = [super init]){
        self.data = [data mutableCopy];
    }
    return self;
}
- (void)dubleSort {
    
    NSInteger count = self.data.count - 1;
    NSInteger lastIndex = 0;
    for (NSInteger i = count; i >=0; i--){
        lastIndex = 0;
        for (NSInteger j = 1; j <= i ; j++) {
            if ([self.data[j] intValue] < [self.data[j - 1] intValue]) {
                id temp = self.data[j];
                self.data[j] = self.data[j - 1];
                self.data[j - 1] = temp;
                lastIndex = j;
            }
            
        }
        i = lastIndex;
    }
}
-(void)selectSort {
    
    NSInteger count = self.data.count - 1;
    NSInteger maxIndex = 0;
    for (NSInteger i = 0; i <= count; i++){
        maxIndex = 0;
        for (NSInteger j = 0; j <= count - i ; j++) {
            if ([self.data[maxIndex] intValue] < [self.data[j] intValue]) {
                maxIndex = j;
            }
        }
        if (maxIndex != (count - i)){
            id temp = self.data[maxIndex];
            self.data[maxIndex] = self.data[count - i];
            self.data[count - i] = temp;
        }
        
        NSLog(@"%@ -- %ld",self,(long)maxIndex);
        
    }
}
-(NSString *)description {
    NSMutableString *des = [NSMutableString string];
    for (NSNumber *num in self.data) {
        [des appendFormat:@"%@",num];
        [des appendFormat:@"%s"," "];
    }
    return des;
}
@end
