//
//  ViewController.m
//  LinkList
//
//  Created by 张占勇 on 2022/3/18.
//

#import "ViewController.h"
#import "LinkList.h"
#import "BSTList.h"
#import "BSTNode.h"
#import "Sort.h"
#import "HeapTreee.h"
#import "Insert.h"
#import "Tool.h"
#import "DictTree.h"
#import "CountSort.h"
#import "QuickFind.h"
#import "QuickUion.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self quickUion];
}
- (void)quickUion {
    QuickUion *qf = [[QuickUion alloc]initWith:@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7"]];
    [qf uion:@"0" other:@"1"];
    [qf uion:@"1" other:@"2"];
    [qf uion:@"2" other:@"3"];
    [qf uion:@"4" other:@"5"];
    [qf uion:@"6" other:@"7"];
    
    [qf uion:@"0" other:@"4"];
    NSString *root = [qf find:@"0"];
    NSLog(@"---%d -%@",[qf isSame:@"2" other:@"4"],root);
}
- (void)countSort {
    CountSort *sort = [[CountSort alloc]sortWith:@[@9,@8,@7,@6,@2,@3,@5,@8]];
    NSLog(@"---%@",sort);
}
- (void)shellSort {
    Sort *sort = [[Sort alloc]initWith:@[@12,@42,@23,@20,@244,@21,@26,@2,@62]];
    [sort shellSort];
    NSLog(@"%@",sort);
}
- (void)mergerSort {
    Sort *sort = [[Sort alloc]initWith:@[@12,@42,@23,@20,@244,@21,@26,@2,@62]];
    [sort mergeSort];
    NSLog(@"%@",sort);
}
- (void)quickSort {
    Sort *sort = [[Sort alloc]initWith:@[@12,@42,@23,@20,@244,@21,@26,@2,@62]];
    [sort quickSort];
    NSLog(@"%@",sort);
}
- (void)DictionyTree {
    DictTree *tree = [[DictTree alloc]init];
    [tree addElenment:@"dog"];
    [tree addElenment:@"dogg"];
    [tree addElenment:@"car"];
    assert([tree startWith:@"c"]);
    [tree remove:@"dog"];
}
- (void)heapTree {
    HeapTreee *heap = [[HeapTreee alloc]initWith:@[] compare:^int(NSString *value1, NSString *value2) {
        return ((int)[value2 compare:value1]);
    }];

    NSArray *data = @[@"2",@"8",@"7",@"4",@"6",@"1",@"9"];
    for (NSInteger i = 0; i < data.count; i++) {
        if(i < 3) {
            [heap addElement:data[i]];
        } else {
            NSString *value = [heap get];
            if ( [value compare:data[i]] < 0){
                [heap replece:data[i]];
            }
        }
    }
 
}
- (void)insertSort {
    
    Insert *sort = [[Insert alloc]sortWith:@[@6,@2,@7,@5,@1,@9,@10,@11,@12,@4]];
    [sort sort];
    NSLog(@"%@",sort);
}

- (void)testBST {
    
    BSTList *list = [[BSTList alloc]init];
    NSArray *data = @[@"6",@"7",@"4",@"10",@"2",@"5"];
    for (int i = 0; i < data.count; i++){
        
        [list addElement: [NSString stringWithFormat:@"%@",data[i]]];
    }
    
    if (!list.isEmpty) {

        [list tralveElement:^(BSTNode *node) {
              
            NSLog(@"------%@",[NSString stringWithFormat:@"left %@---value: %@ right--%@ parent -- %@", node.left ,node.value,node.right, node.parent]);
        }];
    }
}

- (void)testLink {
    
    LinkList *list = [[LinkList alloc]init];
    for (int i = 0; i < 9; i++){
        
        [list addElement: [NSString stringWithFormat:@"%d",i]];
    }
    for (int i = 2; i < 6; i++){

        [list removeElement: [NSString stringWithFormat:@"%d",i]];
    }
    
    if (!list.isEmpty) {

        [list tralveElement:^(Node *node) {
              
            NSLog(@"------%@",[NSString stringWithFormat:@"pre %@---value: %@ next--%@", node.prev ,node.value,node.next]);
        }];
    }
}
@end
