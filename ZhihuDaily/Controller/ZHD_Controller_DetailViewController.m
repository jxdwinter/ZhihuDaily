//
//  ZHD_Controller_DetailViewController.m
//  ZhihuDaily
//
//  Created by JiangXiaodong on 5/30/14.
//  Copyright (c) 2014 jxdwinter. All rights reserved.
//

#import "ZHD_Controller_DetailViewController.h"
#import "ZHD_Client.h"
#import "ZHD_Entity_StoryDetail.h"

@interface ZHD_Controller_DetailViewController ()<UIWebViewDelegate>

@property (nonatomic, strong) ZHD_Client *client;
@property (nonatomic, strong) ZHD_Entity_StoryDetail *detail;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (strong, nonatomic) UIActivityIndicatorView *spinner;

@end

@implementation ZHD_Controller_DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    self.client = [ZHD_Client sharedClient];
    [self.client getPostContentByID:[NSString stringWithFormat:@"%@",self.storyId]
                     withController:self
                            success:^(ZHD_Entity_StoryDetail *story) {
                                self.detail = story;
                                _spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
                                [_spinner setColor:[ZHD_GlobalClass sharedTextColor]];
                                [_spinner setCenter:CGPointMake(300.0 , 20.0)];
                                UIBarButtonItem * barButton = [[UIBarButtonItem alloc] initWithCustomView:_spinner];
                                [self navigationItem].rightBarButtonItem = barButton;
                                [_spinner startAnimating];
                                [self setUpView];
                           }failure:^(NSError *error) {

                           }];
    
}

- (void)setUpView
{
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0.0, 0.0, SCREENWIDTH, SCREENHEIGHT - 64.0 - 49.0)];
    [self.view addSubview:self.scrollView];

    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0.0, 0.0, SCREENWIDTH, 0.0)];
    webView.delegate = self;

    NSString *htmlString = [NSString stringWithFormat:@"<!DOCTYPE html>\n<html>\n  <head>\n  <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"/>\n\t<link rel=\'stylesheet\' href=\'%@\' />\n    <title></title>\n\n  </head>\n  <body>\n%@\n  </body>\n</html>",[self.detail.css firstObject],self.detail.body];

    [webView loadHTMLString:htmlString baseURL:nil];
    [self.scrollView addSubview:webView];

}

- (void)webViewDidFinishLoad:(UIWebView *)webView {

    CGRect frame = webView.frame;
    frame.size.height = 1;
    webView.frame = frame;
    CGSize fittingSize = [webView sizeThatFits:CGSizeZero];
    frame.size = fittingSize;
    frame.size = CGSizeMake(320.0, fittingSize.height*320.0/fittingSize.width);
    webView.frame = frame;

    self.scrollView.contentSize = CGSizeMake(SCREENWIDTH, frame.size.height);

    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, SCREENWIDTH, 200.0)];
    [imageView setContentScaleFactor:[[UIScreen mainScreen] scale]];
    imageView.contentMode =  UIViewContentModeScaleAspectFill;
    imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    imageView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    imageView.clipsToBounds  = YES;
    [imageView setImageWithURL:[NSURL URLWithString:self.detail.image] placeholderImage:nil];
    [self.scrollView addSubview:imageView];

    [_spinner stopAnimating];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
