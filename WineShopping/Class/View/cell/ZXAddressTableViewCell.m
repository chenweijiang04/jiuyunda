//
//  ZXAddressTableViewCell.m
//  WineShopping
//
//  Created by xinying on 2017/4/26.
//  Copyright © 2017年 habav. All rights reserved.
//

#import "ZXAddressTableViewCell.h"

@interface ZXAddressTableViewCell ()

@property(nonatomic,strong)ZXAddress *address;

@end

@implementation ZXAddressTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.subject = [RACSubject subject];
}

- (void)updateAddress:(ZXAddress *)address
{
    self.address            = address;
    self.w_nameLabel.text   = address.w_name;
    self.w_phoneLabel.text  = address.w_phone;
    self.w_addresslabel.text= address.w_address;
}
- (IBAction)w_editBtnClick:(id)sender {
    [self.subject sendNext:@{@"code":@100,@"address":self.address}];
}

- (IBAction)w_deleteBtnClick:(id)sender {
    [self.subject sendNext:@{@"code":@-100,@"address":self.address}];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
