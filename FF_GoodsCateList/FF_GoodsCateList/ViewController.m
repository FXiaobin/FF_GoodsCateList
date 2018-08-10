//
//  ViewController.m
//  FF_GoodsCateList
//
//  Created by mac on 2018/8/8.
//  Copyright © 2018年 healifeGroup. All rights reserved.
//

#import "ViewController.h"
#import "LeftCell.h"
#import "RightCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>


@property (nonatomic,strong) UITableView *leftTableView;


@property (nonatomic,strong) UITableView *rightTableView;


@property (nonatomic,strong) NSArray *leftArr;


@property (nonatomic,strong) NSArray *rightArr;


@property (nonatomic,assign) BOOL isClickLeftCell;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.leftArr = @[@"服饰",@"化妆品",@"粮油",@"家居家装",@"生鲜美食",@"母婴",@"电器",@"洗护",@"电子产品",@"家居家装",@"生鲜美食",@"母婴",@"电器",@"洗护",@"电子产品",@"洗护",@"电子产品",@"其他"];
    self.rightArr = @[
                      @[@"上衣",@"短裤",@"T恤",@"短裤",@"T恤",@"短裤",@"T恤",@"T恤",@"短裤",@"T恤",@"短裤",@"T恤"],
                      @[@"爽肤水",@"洗面奶",@"润肤霜",@"洗面奶",@"润肤霜",@"洗面奶",@"润肤霜",@"洗面奶",@"润肤霜"],
                      @[@"大米",@"黑豆",@"金龙鱼油",@"燕麦片",@"黑豆",@"金龙鱼油",@"燕麦片",@"黑豆",@"金龙鱼油",@"燕麦片",@"黑豆",@"金龙鱼油",@"燕麦片",@"黑豆",@"金龙鱼油",@"燕麦片",@"黑豆",@"金龙鱼油",@"燕麦片"],
                      @[@"上衣",@"短裤",@"T恤",@"短裤",@"T恤",@"短裤",@"T恤",@"T恤",@"短裤",@"T恤",@"短裤",@"T恤"],
                      @[@"爽肤水",@"洗面奶",@"润肤霜",@"洗面奶",@"润肤霜",@"洗面奶",@"润肤霜",@"洗面奶",@"润肤霜"],
                      @[@"大米",@"黑豆",@"金龙鱼油",@"燕麦片",@"黑豆",@"金龙鱼油",@"燕麦片",@"黑豆",@"金龙鱼油",@"燕麦片",@"黑豆",@"金龙鱼油",@"燕麦片",@"黑豆",@"金龙鱼油",@"燕麦片",@"黑豆",@"金龙鱼油",@"燕麦片"],
                      @[@"上衣",@"短裤",@"T恤",@"短裤",@"T恤",@"短裤",@"T恤",@"T恤",@"短裤",@"T恤",@"短裤",@"T恤"],
                      @[@"爽肤水",@"洗面奶",@"润肤霜",@"洗面奶",@"润肤霜",@"洗面奶",@"润肤霜",@"洗面奶",@"润肤霜"],
                      @[@"大米",@"黑豆",@"金龙鱼油",@"燕麦片",@"黑豆",@"金龙鱼油",@"燕麦片",@"黑豆",@"金龙鱼油",@"燕麦片",@"黑豆",@"金龙鱼油",@"燕麦片",@"黑豆",@"金龙鱼油",@"燕麦片",@"黑豆",@"金龙鱼油",@"燕麦片"],
                      @[@"上衣",@"短裤",@"T恤",@"短裤",@"T恤",@"短裤",@"T恤",@"T恤",@"短裤",@"T恤",@"短裤",@"T恤"],
                      @[@"爽肤水",@"洗面奶",@"润肤霜",@"洗面奶",@"润肤霜",@"洗面奶",@"润肤霜",@"洗面奶",@"润肤霜"],
                      @[@"大米",@"黑豆",@"金龙鱼油",@"燕麦片",@"黑豆",@"金龙鱼油",@"燕麦片",@"黑豆",@"金龙鱼油",@"燕麦片",@"黑豆",@"金龙鱼油",@"燕麦片",@"黑豆",@"金龙鱼油",@"燕麦片",@"黑豆",@"金龙鱼油",@"燕麦片"],
                      @[@"上衣",@"短裤",@"T恤",@"短裤",@"T恤",@"短裤",@"T恤",@"T恤",@"短裤",@"T恤",@"短裤",@"T恤"],
                      @[@"爽肤水",@"洗面奶",@"润肤霜",@"洗面奶",@"润肤霜",@"洗面奶",@"润肤霜",@"洗面奶",@"润肤霜"],
                      @[@"大米",@"黑豆",@"金龙鱼油",@"燕麦片",@"黑豆",@"金龙鱼油",@"燕麦片",@"黑豆",@"金龙鱼油",@"燕麦片",@"黑豆",@"金龙鱼油",@"燕麦片",@"黑豆",@"金龙鱼油",@"燕麦片",@"黑豆",@"金龙鱼油",@"燕麦片"],
                      @[@"上衣",@"短裤",@"T恤",@"短裤",@"T恤",@"短裤",@"T恤",@"T恤",@"短裤",@"T恤",@"短裤",@"T恤"],
                      @[@"爽肤水",@"洗面奶",@"润肤霜",@"洗面奶",@"润肤霜",@"洗面奶",@"润肤霜",@"洗面奶",@"润肤霜"],
                      @[@"大米",@"黑豆",@"金龙鱼油",@"燕麦片",@"黑豆",@"金龙鱼油",@"燕麦片",@"黑豆",@"金龙鱼油",@"燕麦片",@"黑豆",@"金龙鱼油",@"燕麦片",@"黑豆",@"金龙鱼油",@"燕麦片",@"黑豆",@"金龙鱼油",@"燕麦片"]
                     ];
    
    [self.view addSubview:self.leftTableView];
    [self.view addSubview:self.rightTableView];
    
    
    

 
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return tableView == self.leftTableView ? 1 : self.rightArr.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.leftTableView) {
        return self.leftArr.count;
    }else{
        NSArray *arr = self.rightArr[section];
        return arr.count;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.leftTableView) {
        LeftCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LeftCell" forIndexPath:indexPath];
        cell.titleLabel.text = self.leftArr[indexPath.row];
        return cell;
    }
    
    RightCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RightCell" forIndexPath:indexPath];
    NSArray *arr = self.rightArr[indexPath.section];
    cell.textLabel.text = arr[indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (tableView == self.rightTableView) {
        return 44.0;
    }
    return CGFLOAT_MIN;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView == self.leftTableView) {
        self.isClickLeftCell = YES;
        //[tableView deselectRowAtIndexPath:indexPath animated:NO];
        //[_leftTableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionTop];
        [_rightTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:indexPath.row] atScrollPosition:UITableViewScrollPositionTop animated:YES];
    }else{
        
    }
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if (self.isClickLeftCell) {
        return;
    }
    
    if (scrollView == self.rightTableView) {
        NSIndexPath *indexPath = [self.rightTableView indexPathsForVisibleRows].firstObject;
        NSIndexPath *moveIndexPath = [NSIndexPath indexPathForRow:indexPath.section inSection:0];
        [self.leftTableView selectRowAtIndexPath:moveIndexPath animated:YES scrollPosition:UITableViewScrollPositionMiddle];
    }else{
        return;
    }
    
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    if (scrollView == self.rightTableView) {
        self.isClickLeftCell = NO;
    }
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    self.isClickLeftCell = NO;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (tableView == self.rightTableView) {
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 44)];
        titleLabel.text = self.leftArr[section];
        titleLabel.backgroundColor = [UIColor orangeColor];
        return titleLabel;
    }
    return nil;
}

-(UITableView *)leftTableView{
    if (_leftTableView == nil) {
        _leftTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, 120, CGRectGetHeight(self.view.frame)-20) style:UITableViewStylePlain];
        _leftTableView.delegate = self;
        _leftTableView.dataSource = self;
        _leftTableView.tableFooterView = [UIView new];
        _leftTableView.showsVerticalScrollIndicator = NO;
        [_leftTableView registerClass:[LeftCell class] forCellReuseIdentifier:@"LeftCell"];
        [_leftTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionMiddle];
        
        _leftTableView.layer.shadowOffset=CGSizeMake(-3, 3);
        
        _leftTableView.layer.shadowColor= [UIColor grayColor].CGColor;
        
        _leftTableView.layer.shadowRadius= 5;
        
        _leftTableView.layer.shadowOpacity= .5f;
        ///这句话很重要 不然不显示
        _leftTableView.clipsToBounds = NO;

    }
    return _leftTableView;
}

-(UITableView *)rightTableView{
    if (_rightTableView == nil) {
        _rightTableView = [[UITableView alloc] initWithFrame:CGRectMake(130, 20, CGRectGetWidth(self.view.frame) - 130, CGRectGetHeight(self.view.frame)-20) style:UITableViewStylePlain];
        _rightTableView.delegate = self;
        _rightTableView.dataSource = self;
        _rightTableView.tableFooterView = [UIView new];
        [_rightTableView registerClass:[RightCell class] forCellReuseIdentifier:@"RightCell"];
    }
    return _rightTableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
