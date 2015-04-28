//
//  DwfmsSegue.m
//  TEST_DWFMS_EMG
//
//  Created by youngseok Kim on 2015. 4. 29..
//  Copyright (c) 2015년 kimhyang. All rights reserved.
//

#import "DwfmsSegue.h"

@implementation DwfmsSegue


- (void)perform {
    
    //하나의 클래스에 여러개의 처리를 위해 id를 이용하여 분기해도 됨.
    NSLog(@"%@", self.identifier);
    
    
    //뷰콘트롤러 인스턴스 취득
    UIViewController *sourceViewController = (UIViewController *)self.sourceViewController;
    UIViewController *destinationViewController = (UIViewController *)self.destinationViewController;
    
    if ([self.identifier isEqualToString:@"menuPush"]) {
        
        //화면전환 애니메이션
        [UIView transitionWithView:sourceViewController.navigationController.view
                          duration:0.5f
                           options:UIViewAnimationOptionTransitionCrossDissolve
                        animations:^{
                            //실제로 화면전환코드를 작성. 단 애니메이션은 겹치지 않도록 NO로 설정
                            [sourceViewController.navigationController pushViewController:destinationViewController animated:NO];
                        }
                        completion:nil];
        
    }else if([self.identifier isEqualToString:@"menuPush"]) {
        
        //화면전환 애니메이션
        [UIView transitionWithView:sourceViewController.navigationController.view
                          duration:0.5f
                           options:UIViewAnimationOptionTransitionCrossDissolve
                        animations:^{
                            //실제로 화면전환코드를 작성. 단 애니메이션은 겹치지 않도록 NO로 설정
                            [sourceViewController.navigationController popViewControllerAnimated:NO];
                        }
                        completion:nil];
        
    }
    
}

@end