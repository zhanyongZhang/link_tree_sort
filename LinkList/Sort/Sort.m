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
#pragma shell

- (void)shellSort {
    NSArray *steps = [self squeceStep];
    for(NSNumber *step in  steps) {
        [self sllSort:[step integerValue]];
    }
}
- (void)sllSort:(NSInteger)step {
    for (NSInteger col = 0; col < step; col ++){
        for(NSInteger begin = (col + step); begin < self.data.count; begin += step) {
            NSInteger curr = begin;
            while (curr > 0 && [self.data[begin] intValue] < [self.data[begin - step] intValue]) {
                NSNumber *value = self.data[begin];
                self.data[begin] = self.data[begin - step];
                self.data[begin - step] = value;
                curr -= step;
            }
        }
    }
}
-(NSArray *)squeceStep {
    NSMutableArray *steps = [NSMutableArray array];
    NSInteger count = self.data.count;
    while (count >>= 2 > 0) {
        [steps addObject:@(count)];
    }
    return [steps copy];
}
#pragma merge
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
    NSInteger li = 0,le = mid - begin;
    NSInteger ri = mid,re = end;
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
#pragma quick
- (void)quickSort {
    [self qsort:0 end:self.data.count];
}
- (void)qsort:(NSInteger)begin end:(NSInteger)end {
    //找轴点
    if(end - begin < 2) return;
    NSInteger pevit = [self pevit:begin end:end];
    [self qsort:begin end:pevit];
    [self qsort:pevit + 1 end:end];
}
- (NSInteger)pevit:(NSInteger)begin end:(NSInteger)end {
    NSNumber *pValue = self.data[begin];
    end--;
    while (begin < end) {
        while (begin < end) {
            if([self.data[end] intValue] > [pValue intValue]) {
                end--;
            }else{
                NSLog(@"---%@",self.data[end]);
                self.data[begin++] = self.data[end];
                break;
            }
        }
        while (begin < end) {
            if([self.data[begin] intValue] < [pValue intValue]) {
                begin++;
            }else{
                NSLog(@"---%@",self.data[begin]);
                self.data[end--] = self.data[begin];
                break;;
            }
        }
    }
    self.data[begin] = pValue;
    return begin;
}
#pragma duble
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
#pragma select
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
