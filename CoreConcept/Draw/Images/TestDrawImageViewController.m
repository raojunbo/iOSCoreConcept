//
//  TestDrawImageViewController.m
//  testdown
//
//  Created by rjb on 2017/12/2.
//  Copyright © 2017年 rjb. All rights reserved.
//

#import "TestDrawImageViewController.h"

@interface TestDrawImageViewController ()
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIImageView *secondImageView;
@end

@implementation TestDrawImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    [self.view addSubview:self.imageView];
    self.imageView.backgroundColor = [UIColor greenColor];
    
    NSData *data = bytesFromRGBImage([UIImage imageNamed:@"chat"]);
    UIImage *image = iamgeFromBytes(data, [UIImage imageNamed:@"chat"].size);
    self.imageView.image = image;

    self.secondImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 200)];
    [self.view addSubview:self.secondImageView];
    self.secondImageView.image = resizeImage();
    
}

//创建自定义图片
- (UIImage *)createImage{
    CGRect rect = CGRectMake(0, 0, 100, 100);
    UIGraphicsBeginImageContextWithOptions(rect.size, YES, [UIScreen mainScreen].scale);
    [[UIColor redColor]set];//(这句话在context里不太懂)
    UIRectFill(rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    return image;
}
//创建缩略图
UIImage *buildThumbnail(UIImage *sourceImage,CGSize targetSize){
    UIGraphicsBeginImageContextWithOptions(targetSize, YES, 2);
    CGRect naturalRect = (CGRect){.size = sourceImage.size};//这种写法有意思
    [sourceImage drawInRect:naturalRect];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    return image;
}
UIImage *buildThumbnail2(UIImage *sourceImage,CGSize targetSize,Boolean useFittin){
    UIGraphicsBeginImageContextWithOptions(targetSize, YES, [UIScreen mainScreen].scale);
    CGRect targeRect = CGRectMake(0, 0, targetSize.width, targetSize.height );
    CGRect sourceRect = (CGRect){.size = sourceImage.size};
//    CGRect destinationRect = useFittin ? Rectbu
//
    return nil;
}
//创建
- (UIImage *)extractRectFromImage:(UIImage *)sourceImage rect:(CGRect) subRect{
    CGImageRef imageRef = CGImageCreateWithImageInRect(sourceImage.CGImage, subRect);
    if (imageRef!=nil) {
        UIImage *outImage = [[UIImage alloc]initWithCGImage:imageRef];
        return outImage;
    }
    return nil;
}
- (UIImage *)createGrayImage:(UIImage *)sourceImage{
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
    //采用灰度的颜色空间
    int width = sourceImage.size.width;
    int height = sourceImage.size.height;
    //思考，这里的soureceImae是逻辑点
    CGContextRef context = CGBitmapContextCreate(NULL, width, height, 8, width, colorSpace, (CGBitmapInfo) kCGImageAlphaNone);
    CGContextDrawImage(context, (CGRect){.size = sourceImage.size}, sourceImage.CGImage);
        CGImageRef imageRef = CGBitmapContextCreateImage(context);
    UIImage *image = [[UIImage alloc]initWithCGImage:imageRef];
    return image;
}

/*
 生成最原始bitmap字节属猪NSData数据
 */
NSData *bytesFromRGBImage(UIImage * sourceImage){
    
    if(!sourceImage){
        return nil;
    }
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    if (colorSpace == NULL) {
        return nil;
    }
    int width = sourceImage.size.width;
    int height = sourceImage.size.height;
    CGContextRef context = CGBitmapContextCreate(NULL, width, height, 8, width *4, colorSpace, (CGBitmapInfo) kCGImageAlphaPremultipliedFirst);
    CGColorSpaceRelease(colorSpace);
    if (context == NULL) {
        return nil;
    }
    CGRect rect = (CGRect){.size = sourceImage.size};
    CGContextDrawImage(context, rect, sourceImage.CGImage);//相当于生成bitmap字节数组
    NSData *data = [NSData dataWithBytes:CGBitmapContextGetData(context) length:width *height *4];
    CGContextRelease(context);
    return data;
}
UIImage *iamgeFromBytes(NSData *data,CGSize targetSize){
    int width = targetSize.width;
    int height = targetSize.height;
    if (data.length<(width *height *4)) {
        return nil;
    }
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    if(colorSpace == NULL){
        return nil;
    }
    Byte *bytes = (Byte *)data.bytes;//字节数组
    CGContextRef context = CGBitmapContextCreate(bytes,width, height, 8, width *4, colorSpace, (CGBitmapInfo) kCGImageAlphaPremultipliedFirst);
    if (context == NULL) {
        return nil;
    }
    CGImageRef imageRef = CGBitmapContextCreateImage(context);
    UIImage *image = [UIImage imageWithCGImage:imageRef];
    return image;
}

UIImage *resizeImage(){
    CGSize targetSize = CGSizeMake(100,100);
    UIGraphicsBeginImageContextWithOptions(targetSize, NO, [UIScreen mainScreen].scale);
    CGRect targeRect = (CGRect){.size=targetSize};
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:targeRect cornerRadius:10];
    [[UIColor redColor]set];
    [bezierPath fill];
    [bezierPath stroke];
  
    UIBezierPath *innerBezierPath = [UIBezierPath bezierPathWithRoundedRect:CGRectInset(targeRect, 10, 10) cornerRadius:10];
    [[UIColor greenColor]set];
    [innerBezierPath stroke];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImage *resizeImage = [image resizableImageWithCapInsets:UIEdgeInsetsMake(20, 20, 20, 20)];
    
    return resizeImage;
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
