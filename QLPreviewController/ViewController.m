//
//  ViewController.m
//  QLPreviewController
//
//  Created by 刘浩浩 on 16/3/29.
//  Copyright © 2016年 CodingFire. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor=[UIColor whiteColor];
    UIButton *button=[UIButton buttonWithType:UIButtonTypeSystem];
    button.frame=CGRectMake(100, 100, 100, 100);
    button.backgroundColor=[UIColor orangeColor];
    [button setTitle:@"Btn" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
  }
-(void)btnAction
{
    QLPreviewController *previewController = [[QLPreviewController alloc] init];
    previewController.dataSource = self;
    previewController.delegate = self;
    previewController.currentPreviewItemIndex = 0;
    
    [self presentViewController:previewController animated:YES completion:nil];

}
#pragma mark - QLPreviewControllerDelegate
-(CGRect)previewController:(QLPreviewController *)controller frameForPreviewItem:(id<QLPreviewItem>)item inSourceView:(UIView *__autoreleasing *)view
{
    //提供变焦的开始rect，扩展到全屏
    return CGRectMake(60, 200, 200, 200);
}

- (NSInteger)numberOfPreviewItemsInPreviewController:(QLPreviewController *)previewController{
    return 1;
}

- (id)previewController:(QLPreviewController *)previewController previewItemAtIndex:(NSInteger)idx{
    
    NSString *pathStr=[[NSBundle mainBundle]pathForResource:@"iOS面试题" ofType:@"docx"];
    NSURL *fileURL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@",pathStr]];
    
    return fileURL;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
