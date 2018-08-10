//
//  LeftCell.m
//  FF_GoodsCateList
//
//  Created by mac on 2018/8/8.
//  Copyright © 2018年 healifeGroup. All rights reserved.
//

#import "LeftCell.h"

@implementation LeftCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    if (selected) {
        self.titleLabel.textColor = [UIColor whiteColor];
        self.contentView.backgroundColor = [UIColor orangeColor];
        self.tagIcon.backgroundColor = [UIColor redColor];
    }else{
        self.titleLabel.textColor = [UIColor blackColor];
        self.contentView.backgroundColor = [UIColor whiteColor];
        self.tagIcon.backgroundColor = [UIColor whiteColor];
    }
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
      
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.tagIcon];
  
        
    }
    return self;
}

-(UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 85, 44) ];
      
    }
    return _titleLabel;
}

-(UIImageView *)tagIcon{
    if (_tagIcon == nil) {
        _tagIcon = [[UIImageView alloc] initWithFrame:CGRectMake(100, 0, 20, 44)];
    }
    return _tagIcon;
}

@end
