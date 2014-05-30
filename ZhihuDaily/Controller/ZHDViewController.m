//
//  ZHDViewController.m
//  ZhihuDaily
//
//  Created by JiangXiaodong on 5/29/14.
//  Copyright (c) 2014 jxdwinter. All rights reserved.
//

#import "ZHDViewController.h"

#import "ZHD_Client.h"
#import "ZHD_View_ZHDViewController_TableView_HeaderView.h"
#import "ZHD_View_ViewController_TableViewCell.h"
#import "ZHD_Entity_Story.h"
#import "ZHD_Controller_DetailViewController.h"

@interface ZHDViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) ZHD_Client *client;

@property (nonatomic, strong) UITableView    *tableView;
@property (nonatomic, strong) ZHD_View_ZHDViewController_TableView_HeaderView   *scrollView;
@property (nonatomic, strong) NSMutableArray *storiesDataSource;
@property (nonatomic, strong) NSMutableArray *topStoriesDataSource;
@property (nonatomic, assign) NSString       *date;

@end

@implementation ZHDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    self.navigationController.navigationBar.translucent = NO;
    self.title = @"日报";
    self.view.backgroundColor = [UIColor whiteColor];

    self.storiesDataSource = [[NSMutableArray alloc] initWithCapacity:50];
    self.topStoriesDataSource = [[NSMutableArray alloc] initWithCapacity:50];
    self.client = [ZHD_Client sharedClient];

    [self getData];

}

- (void)setUpTableView{
    self.scrollView = [[ZHD_View_ZHDViewController_TableView_HeaderView alloc]
                       initWithFrame:CGRectMake(0.0, 0.0, [UIScreen mainScreen].bounds.size.width, 160.0)
                       withTopStories:self.topStoriesDataSource];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0, 0.0,
                                                                   [UIScreen mainScreen].bounds.size.width,
                                                                   [UIScreen mainScreen].bounds.size.height - 64.0)
                                                  style:UITableViewStylePlain];
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0,49, 0);
    self.tableView.tableHeaderView = self.scrollView;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView setBackgroundView:nil];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];

}

- (void)getData{

    [_client getLatestPostsWithController:self
                                  success:^(NSString *date, NSArray *topStories, NSArray *stories) {
                                      self.date = date;
                                      [self.storiesDataSource addObjectsFromArray:stories];
                                      [self.topStoriesDataSource addObjectsFromArray:topStories];

                                      [self setUpTableView];

                                  } failure:^(NSError *error) {

                                  }];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.storiesDataSource count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    ZHD_Entity_Story *story =  [self.storiesDataSource objectAtIndex:[indexPath row]];
    ZHD_View_ViewController_TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if ( cell == nil ){
        cell = [[ZHD_View_ViewController_TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    [cell.thumbnailImageView setImageWithURL:[NSURL URLWithString:story.image] placeholderImage:nil];
    story.title = [story.title stringByAppendingString:@"\n \n \n \n "];

    cell.titleLabel.text = story.title;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZHD_Entity_Story *story =  [self.storiesDataSource objectAtIndex:[indexPath row]];
    ZHD_Controller_DetailViewController *detailViewController = [[ZHD_Controller_DetailViewController alloc] init];
    detailViewController.storyId = story.storyId;
    [self.navigationController pushViewController:detailViewController animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
