//
//  ViewController.m
//  sampleProj
//
//  Created by 島田 武史 on 2015/06/09.
//  Copyright (c) 2015年 島田 武史. All rights reserved.
//

#import "ViewController.h"
#import "AMOLayoutConstraint.h"

@interface ViewController ()
@property (nonatomic, strong) UIView* childView;
@property (nonatomic, copy) NSMutableArray* constraints;
@end

@implementation ViewController

- (void)viewDidLoad {
    
    self.view.backgroundColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.3];

    
    
    CGRect childFrame = CGRectMake(10, 200, 200, 50);
    UIView* childView = [[UIView alloc] initWithFrame:childFrame];
    childView.translatesAutoresizingMaskIntoConstraints = NO;
    childView.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:childView];

    
    NSArray* constraints =
    @[
      [NSLayoutConstraint constraintWithItem:childView
                                   attribute:NSLayoutAttributeLeft
                                   relatedBy:NSLayoutRelationEqual
                                      toItem:self.view
                                   attribute:NSLayoutAttributeLeft
                                  multiplier:1.f constant:50.0f],
      
      [NSLayoutConstraint constraintWithItem:childView
                                   attribute:NSLayoutAttributeRight
                                   relatedBy:NSLayoutRelationEqual
                                      toItem:self.view
                                   attribute:NSLayoutAttributeRight
                                  multiplier:1.f constant:-50.0f],
      
      [NSLayoutConstraint constraintWithItem:childView
                                   attribute:NSLayoutAttributeTop
                                   relatedBy:NSLayoutRelationEqual
                                      toItem:self.view
                                   attribute:NSLayoutAttributeTop
                                  multiplier:1.f constant:150.0f],
      
      [NSLayoutConstraint constraintWithItem:childView
                                   attribute:NSLayoutAttributeBottom
                                   relatedBy:NSLayoutRelationEqual
                                      toItem:self.view
                                   attribute:NSLayoutAttributeBottom
                                  multiplier:1.f constant:-150.0f]
      ];
    
    
    NSArray* constraints2 =
    @[
      [AMOLayoutConstraint constraintWithItem:childView
                                   attribute:NSLayoutAttributeBottom
                                   relatedBy:NSLayoutRelationEqual
                                      toItem:self.view
                                   attribute:NSLayoutAttributeBottom
                                  multiplier:1.f constant:-250.0f]
      ];
    
    for (NSLayoutConstraint* constraint in constraints){
        constraint.priority = UILayoutPriorityDefaultHigh;
    }
    
    for (NSLayoutConstraint* constraint in constraints2){
        constraint.priority = UILayoutPriorityDefaultLow;
    }

    NSLayoutConstraint* constraint3 = [[NSLayoutConstraint alloc] init];
    constraint3.priority = UILayoutPriorityFittingSizeLevel;
    
    
    
    [self.view addConstraints:constraints2];
//    [self.view addConstraints:constraints];

    for (NSLayoutConstraint* constraint in self.view.constraints){
        NSLog(@" priority %f " , constraint.priority );
        if ([constraint isKindOfClass:[AMOLayoutConstraint class]]) {
            NSLog(@"hjkl;:");
            
        }
    }

    
    
    self.childView = childView;
    
    UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    CGRect buttonRect = CGRectMake(100, 100, 100, 30);
    button.frame = buttonRect;
    [button setTitle:@"but" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(hoge) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:button];
    
    
    NSInteger cnt = [self.view.constraints count];
    NSLog(@" cnt %ld", cnt );

    [self showConstraintDataWithConstrains:self.view.constraints];
    
    
    NSLog(@"stop ");
    
}


-(void)hoge {
    
    NSInteger cnt = [self.view.constraints count];
    NSLog(@" cnt %ld", cnt );


    NSLog(@"hoge");
    
    /*
    for (NSLayoutConstraint* constraint in self.constraints) {
        [self.view removeConstraint:constraint];
        NSInteger cnt = [self.view.constraints count];
        NSLog(@" cnt %ld", cnt );
        
    }
    */
    
    
     cnt = [self.view.constraints count];
    
//    [self.view removeConstraints:self.view.constraints];
    
    
    
    for (NSLayoutConstraint* constraint in self.view.constraints){
        NSLog(@" priority %f " , constraint.priority );
        if ([constraint isKindOfClass:[AMOLayoutConstraint class]]) {
            NSLog(@"hjkl;:");
        }
    }

    
    [self performSelector:@selector(hoge2) withObject:nil afterDelay:1.0f];

    [self showConstraintDataWithConstrains:self.view.constraints];

    
}

-(void)hoge2 {

    
    for (NSLayoutConstraint* constraint in self.view.constraints){
        NSLog(@" priority %f " , constraint.priority );
        if ([constraint isKindOfClass:[AMOLayoutConstraint class]]) {
            [self.view removeConstraint:constraint];
        }
    }

    
    
    NSLog(@"before constraints count %ld ", [self.view.constraints count] );
//
//    
//    self.constraints
//    = @[
//        [NSLayoutConstraint constraintWithItem:self.childView
//                                     attribute:NSLayoutAttributeLeft
//                                     relatedBy:NSLayoutRelationEqual
//                                        toItem:self.view
//                                     attribute:NSLayoutAttributeLeft
//                                    multiplier:1.f constant:50.0f],
//        
//        [NSLayoutConstraint constraintWithItem:self.childView
//                                     attribute:NSLayoutAttributeRight
//                                     relatedBy:NSLayoutRelationEqual
//                                        toItem:self.view
//                                     attribute:NSLayoutAttributeRight
//                                    multiplier:1.f constant:-50.0f],
//        
//        [NSLayoutConstraint constraintWithItem:self.childView
//                                     attribute:NSLayoutAttributeTop
//                                     relatedBy:NSLayoutRelationEqual
//                                        toItem:self.view
//                                     attribute:NSLayoutAttributeTop
//                                    multiplier:1.f constant:150.0f],
//        
//        [NSLayoutConstraint constraintWithItem:self.childView
//                                     attribute:NSLayoutAttributeBottom
//                                     relatedBy:NSLayoutRelationEqual
//                                        toItem:self.view
//                                     attribute:NSLayoutAttributeBottom
//                                    multiplier:1.f constant:-250.0f]
//        ];
//    
    
    NSArray* constraints2 =
    @[
      [AMOLayoutConstraint constraintWithItem:self.childView
                                    attribute:NSLayoutAttributeBottom
                                    relatedBy:NSLayoutRelationEqual
                                       toItem:self.view
                                    attribute:NSLayoutAttributeBottom
                                   multiplier:1.f constant:-250.0f]
      ];

    
//    [self.view addConstraints:self.constraints];
    [self.view addConstraints:constraints2];
    
    
    
    NSLog(@"after constraints count %ld ", [self.view.constraints count] );
    
    [self showConstraintDataWithConstrains:self.view.constraints];
    

    /*
    for (NSLayoutConstraint* constraint in self.view.constraints){
        if (constraint.priority == UILayoutPriorityDefaultLow) {
            [self.view removeConstraint:constraint];
            break;
        }
    }
     */

    
    NSLog(@"-------------------");
    
    [self showConstraintDataWithConstrains:self.view.constraints];

    
}

-(void)showConstraintDataWithConstrains:(NSArray*)constraints{

    for (NSLayoutConstraint* constraint in constraints){
        NSLog(@"-------------------");
        NSLog(@" pointer %@ ",constraint);
        NSLog(@" pointer %p ",constraint);
        NSLog(@"   priority %f " , constraint.priority);
        
    }

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
