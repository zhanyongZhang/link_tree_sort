//
//  Sort.h
//  LinkList
//
//  Created by 张占勇 on 2022/3/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Sort : NSObject

-(void)shellSort;
-(void)quickSort;
- (void)mergeSort;
- (void)selectSort;
- (void)dubleSort;
-(id)initWith:(NSArray *)data;

@end

NS_ASSUME_NONNULL_END
