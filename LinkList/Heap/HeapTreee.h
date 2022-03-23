//
//  HeapTreee.h
//  LinkList
//
//  Created by 张占勇 on 2022/3/21.
//

#import <Foundation/Foundation.h>

typedef int(^Compare)(NSString *, NSString *);

NS_ASSUME_NONNULL_BEGIN

@interface HeapTreee : NSObject
@property (nonatomic, strong) NSMutableArray *elements;
@property (nonatomic, assign) NSInteger size;
@property (nonatomic, copy) Compare campare;
- (BOOL)isEmpty;
- (void)clear;
-(void)addElement:(NSString *)element;
-(void)replece:(NSString *)element;
- (void)remove;
- (NSString *)get;
- (void)shiftDown:(NSInteger)index;
- (HeapTreee *)initWith:(NSArray *)data compare:(Compare)compare;
@end

NS_ASSUME_NONNULL_END
