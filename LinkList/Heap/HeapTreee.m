//
//  HeapTreee.m
//  LinkList
//
//  Created by 张占勇 on 2022/3/21.
//

#import "HeapTreee.h"

@interface HeapTreee ()

@end

@implementation HeapTreee
- (instancetype)init {
    if(self = [super init]) {
        self.elements = [NSMutableArray array];
    }
    return self;
}
- (HeapTreee *)initWith:(NSArray *)data compare:(nonnull Compare)compare{
    if([self init]) {
        _campare = compare;
        [self heapily: data];
    }
    return self;
}
- (void)heapily:(NSArray *)data {
    if(data.count == 0)return;
    if(self.elements.count == 0){
        [self.elements addObjectsFromArray:data];
        _size = data.count;
    }else {
        for (NSInteger i = 0; i < data.count; i++) {
            [self.elements addObject:data[i]];
            _size++;
        }
    }
//    for (NSInteger i = 0; i < self.elements.count;i++) {
//        [self shitup: i];
//    }
    for (NSInteger i = (_size/2 - 1); i >=0 ;i--) {
        [self shiftDown: i];
    }
}
- (BOOL)isEmpty {
    return _size == 0;
}
- (void)clear {
    _size = 0;
    [self.elements removeAllObjects];

}
- (void)replece:(NSString *)element {
    if (_size == 0){
        self.elements[0] = element;
        _size++;
        return;
    } else {
        self.elements[0] = element;
        [self shiftDown:0];
    }
}
- (void)addElement:(NSString *)element {
    [self.elements addObject:element];
    _size++;
    [self shitup: (_size - 1)];
}
- (void)shitup:(NSInteger)index {
    NSString *value = self.elements[index];
    while (index > 0) {
        NSInteger pIndex = (index - 1)/2;
        NSString *pValue = self.elements[pIndex];
        if(_campare(value, pValue)) break;
        self.elements[index] = pValue;
        index = pIndex;
    }
    self.elements[index] = value;
}
- (NSString *)get {
    if(self.elements.count == 0)return @"";
    return self.elements[0];
}
- (void)remove {
    self.elements[0] = self.elements[_size - 1];
    self.elements[_size - 1] = @"";
    _size--;
    [self shiftDown:0];
}
- (void)shiftDown:(NSInteger)index {
    
    NSString *value = self.elements[index];
    while (index < _size / 2 ) {
        NSInteger cIndex = 2*index + 1;
        NSString *child = self.elements[cIndex];
        NSInteger rIndex = cIndex + 1;
        if (rIndex < _size && _campare(self.elements[rIndex], child)) {
            cIndex = rIndex;
            child = self.elements[rIndex];
        }
        if(_campare(value,child))break;
        self.elements[index] = child;
        index = cIndex;
    }
    self.elements[index] = value;
}
@end
