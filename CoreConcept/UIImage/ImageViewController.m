//
//  ImageViewController.m
//  CoreConcept
//
//  Created by rjb on 2018/7/1.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController ()

@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIImage *image = [UIImage imageNamed:@"check_green"];
    NSData *originData = UIImagePNGRepresentation(image);//这个是没压缩的NSData
    CGImageRef imageRef = image.CGImage;
    CFDataRef rawData = CGDataProviderCopyData(CGImageGetDataProvider(imageRef));//这个事解压缩后的NSData
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
