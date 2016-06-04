//
//  ViewController.m
//  PriceCompare_OC
//
//  Created by ManuQiao on 16/6/2.
//  Copyright © 2016年 ManuQiao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    UITextField *_currentTextfield;
}
@property (weak, nonatomic) IBOutlet UITextField *singlePriceTextField;
@property (weak, nonatomic) IBOutlet UITextField *singleAmountTextField;
@property (weak, nonatomic) IBOutlet UIImageView *chooseSingleImage;
@property (weak, nonatomic) IBOutlet UITextField *multiPriceTextField;
@property (weak, nonatomic) IBOutlet UITextField *multiAmountTextField;
@property (weak, nonatomic) IBOutlet UIImageView *chooseMultiImage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)editingDidBegin:(id)sender {
    if ([sender isKindOfClass:[UITextField class]]) {
        _currentTextfield = (UITextField *)sender;
    }
}

- (IBAction)infomationChanged:(id)sender {
    if (_singlePriceTextField.text == nil
        || [_singlePriceTextField.text isEqualToString:@""]
        || _singleAmountTextField.text == nil
        || [_singleAmountTextField.text isEqualToString:@""]
        || _multiPriceTextField.text == nil
        || [_multiPriceTextField.text isEqualToString:@""]
        || _multiAmountTextField.text == nil
        || [_multiAmountTextField.text isEqualToString:@""]) {
        [_chooseSingleImage setHidden:YES];
        [_chooseMultiImage setHidden:YES];
        return;
    }
    
    float singlePrice = [_singlePriceTextField.text floatValue];
    float singleAmount = [_singleAmountTextField.text floatValue];
    float multiPrice = [_multiPriceTextField.text floatValue];
    float multiAmount = [_multiAmountTextField.text floatValue];
    
    float singleValue = 0.0f;
    float multiValue = 0.0f;
    
    singleValue = singleAmount / singlePrice;
    multiValue = multiAmount / multiPrice;
    
    if (singleValue > multiValue) {
        [_chooseSingleImage setHidden:NO];
        [_chooseMultiImage setHidden:YES];
    }
    else if (singleValue < multiValue) {
        [_chooseMultiImage setHidden:NO];
        [_chooseSingleImage setHidden:YES];
    }
    else {
        [_chooseMultiImage setHidden:NO];
        [_chooseSingleImage setHidden:NO];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (_currentTextfield != nil) {
        [_currentTextfield resignFirstResponder];
    }
}

@end
