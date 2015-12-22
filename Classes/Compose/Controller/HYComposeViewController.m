//
//  HYComposeViewController.m
//  HYWeiBo
//
//  Created by yehowell on 15/11/30.
//  Copyright (c) 2015年 yehowell. All rights reserved.
//

#import "HYComposeViewController.h"
#import "HYTextView.h"
#import "HYComposePhotosView.h"
#import "HYComposeToolBar.h"
#import "HYComposeTool.h"
#import "MBProgressHUD+MJ.h"

@interface HYComposeViewController()<HYComposeToolBarDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextViewDelegate>

@property(nonatomic, weak)HYTextView *textView;

@property(nonatomic,weak)HYComposeToolBar *toolBar;

@property(nonatomic,weak)HYComposePhotosView *photosView;

@property(nonatomic, strong)UIBarButtonItem *rightItem;

@property(nonatomic, weak)NSMutableArray *images;

@end


@implementation HYComposeViewController

-(NSMutableArray *)images
{
    if (_images == nil) {
        _images = [NSMutableArray array];
    }
    return _images;
}


-(void)viewDidLoad
{
    [super viewDidLoad];
    
    
}


-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [_textView becomeFirstResponder];
}


-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


-(void)setUpPhotoView
{
    HYComposePhotosView *photosView = [[HYComposePhotosView alloc] initWithFrame:CGRectMake(0, 70, self.view.width, self.view.height - 70)];
    _photosView = photosView;
    [_textView addSubview:photosView];
}

-(void)keyBoardFrameChange:(NSNotification *)note
{
    CGFloat duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    CGRect frame = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    if (frame.origin.y == self.view.height) {
        [UIView animateWithDuration:duration animations:^{
            _toolBar.transform = CGAffineTransformIdentity;
        }];
    }else{
        [UIView animateWithDuration:duration animations:^{
            _toolBar.transform = CGAffineTransformMakeTranslation(0, -frame.size.height);
        }];
    }
}

-(void)setUpToolBar
{
    CGFloat h = 35;
    CGFloat y = self.view.height - h;
    HYComposeToolBar *toolBar = [[HYComposeToolBar alloc] initWithFrame:CGRectMake(0, y, self.view.width, h)];
    _toolBar = toolBar;
    toolBar.delegate = self;
    [self.view addSubview:toolBar];
    
}

-(void)composeToolBar:(HYComposeToolBar *)toolBar didClickBtn:(NSInteger)index
{
    if (index == 0) {
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
        imagePicker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        imagePicker.delegate = self;
        [self presentViewController:imagePicker animated:YES completion:nil];
    }
}


-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    [self.images addObject:image];
    _photosView.image = image;
    [self dismissViewControllerAnimated:YES completion:nil];
    _rightItem.enabled = YES;
}


-(void)setUpTextView
{
    HYTextView *textView = [[HYTextView alloc] initWithFrame:self.view.bounds];
    _textView = textView;
    textView.placeHolder = @"请分享你的心情";
    textView.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:textView];
    textView.alwaysBounceVertical = YES;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextViewTextDidChangeNotification object:nil];
    
    _textView.delegate = self;
}

-(void)textChange
{
    if (_textView.text.length) {
        _textView.hidePlaceHolder = YES;
        _rightItem.enabled = YES;
    }else{
        _textView.hidePlaceHolder = NO;
        _rightItem.enabled = NO;
    }
}


-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}

-(void)setUpNavigationBar
{
    self.title = @"发送微博";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:0 target:self action:@selector(dismiss)];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"发送" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
    [btn sizeToFit];
    [btn addTarget:self action:@selector(compose) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    rightItem.enabled = NO;
    self.navigationItem.rightBarButtonItem = rightItem;
    _rightItem = rightItem;
}

- (void)dismiss
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(void)compose
{
    if (self.images.count) {
        [self sendPicture];
    }else{
        [self sendText];
    }
}


-(void)sendPicture
{
    UIImage *image = self.images[0];
    NSString *status = _textView.text.length?_textView.text:@"分享图片";
    _rightItem.enabled = NO;
    
    [HYComposeTool compoWithStatus:status image:image success:^{
        
        [MBProgressHUD showSuccess:@"发送图片成功"];
        [self dismissViewControllerAnimated:YES completion:nil];
        _rightItem.enabled = YES;
        
    } failure:^(NSError *error){
        
        NSLog(@"%@",error.description);
        [MBProgressHUD showSuccess:@"发送图片失败"];
        _rightItem.enabled = YES;
        
    }];
}


-(void)sendText
{
    [HYComposeTool composeWithStatus:_textView.text success:^{
    
        [MBProgressHUD showSuccess:@"发送成功"];
        [self dismissViewControllerAnimated:YES completion:nil];
        
    } failure:^(NSError *error){
        NSLog(@"%@",error.description);
        
    }];
}


@end





















