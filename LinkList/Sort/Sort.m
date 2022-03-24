//
//  Sort.m
//  LinkList
//
//  Created by 张占勇 on 2022/3/21.
//

#import "Sort.h"

@interface Sort ()
@property (nonatomic, strong) NSMutableArray *data;
@property (nonatomic, strong) NSMutableArray *leftArr;
@end

@implementation Sort

- (id)initWith:(NSArray *)data {
    if(self = [super init]){
        self.data = [data mutableCopy];
    }
    return self;
}
- (NSMutableArray *)leftArr {
    if(!_leftArr) {
        self.leftArr = [NSMutableArray array];
    }
    return _leftArr;
}
- (void)mergeSort {
    [self dividElement:0 to:self.data.count];
}
- (void)dividElement:(NSInteger)begin to:(NSInteger)end {
    if(end - begin < 2) return;
    NSInteger mid = (end + begin) >> 1;
    [self dividElement:begin to:mid];
    [self dividElement:mid to:end];
    [self merger:begin mid:mid end:end];
}
- (void)merger:(NSInteger)begin mid:(NSInteger)mid end:(NSInteger)end {
    NSInteger li = 0;
    NSInteger le = mid - begin;
    NSInteger ri = mid;
    NSInteger re = end;
    NSInteger ai = begin;
    for(NSInteger i = li;i < le;i++) {
        self.leftArr[i] = self.data[begin + i];
    }
    while (li < le) {
        if((ri < re) && ([_leftArr[li] intValue] > [_data[ri] intValue])) {
            self.data[ai++] = self.data[ri++];
        } else {
            self.data[ai++] = self.leftArr[li++];
        }
    }
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
