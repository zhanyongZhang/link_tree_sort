//
//  LinkList.h
//  LinkList
//
//  Created by 张占勇 on 2022/3/18.
//

#import <Foundation/Foundation.h>
#import "Node.h"
NS_ASSUME_NONNULL_BEGIN
typedef void (^Block)(Node *);

@interface LinkList : NSObject
@property (nonatomic, strong) Node * __nullable first;
@property (nonatomic, assign) int size;
- (BOOL)isEmpty;
- (void)clear;
-(void)addElement:(NSString *)element;
- (void)removeElement:(NSString *)element;
- (void)tralveElement:(Block)block;
@end

NS_ASSUME_NONNULL_END
