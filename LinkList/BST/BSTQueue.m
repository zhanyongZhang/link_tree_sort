//
//  BSTQueue.m
//  LinkList
//
//  Created by 张占勇 on 2022/3/18.
//

#import "BSTQueue.h"

@interface BSTQueue ()
@property (nonatomic, strong) NSMutableArray *left;
@property (nonatomic, strong) NSMutableArray *right;
@end

@implementation BSTQueue
- (instancetype)init {
    if (self = [super init]) {
        self.left = [NSMutableArray array];
        self.right = [NSMutableArray array];
    }
    return  self;
}
- (BOOL)isEmpty {
    return self.size == 0;
}

- (void)pushObject:(BSTNode *)object {
    [self.left addObject:object];
    _size++;
}
- (BSTNode *)pop {
    if(self.right.count == 0 && self.left.count == 0) return nil;
    BSTNode *object = nil;
    if(self.right.count > 0){
         object = [self.right lastObject];
         [self.right removeLastObject];
        _size--;
        return object;
    }
    if(self.left.count > 0) {
        self.right = [self reverseObject:self.left];
        self.left = [NSMutableArray array];
        object = [self.right lastObject];
        [self.right removeLastObject];
        _size--;
    }
    return object;
}
- (NSMutableArray *)reverseObject:(NSMutableArray *)object {
    NSInteger i = 0;
    NSInteger j = object.count - 1;
    while (i < j) {
        NSArray *temp = object[i];
        object[i] = object[j];
        object[j] = temp;
        i++;
        j--;
    }
    return object;
}
@end
