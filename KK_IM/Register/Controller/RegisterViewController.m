//
//  RegisterViewController.m
//  KK_IM
//
//  Created by Admin on 2021/6/26.
//

#import "RegisterViewController.h"
#import "RegisterView.h"
#import "Masonry.h"

@interface RegisterViewController ()

@property (nonatomic,strong) RegisterView* registerView;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    self.registerView = [[RegisterView alloc]init];
    
    
    [self.view addSubview:self.registerView];
    [self.registerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [self.registerView.usernameField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [self.registerView.passwordField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [self.registerView.nickNameField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [self.registerView.registerButton addTarget:self action:@selector(regis) forControlEvents:UIControlEventTouchUpInside];
    
}

// 文本框变化时执行, 判断账号密码和昵称是否都存在
- (void) textChange {
    if (self.registerView.usernameField.text.length > 0 && self.registerView.passwordField.text.length > 0 &&
        self.registerView.nickNameField.text.length > 0) {
        self.registerView.registerButton.enabled = YES;
    }else {
        self.registerView.registerButton.enabled = NO;
    }
}

- (void) regis {
    // TODO: 补全注册逻辑
    KKNetConnect* coon = [[KKNetConnect alloc]init];
    [coon senduserNickName:self.registerView.nickNameField.text andUserId:self.registerView.usernameField.text andPassword:self.registerView.passwordField.text finishBlock:^(NSDictionary * _Nonnull res) {
        //成功注册
        if ([res[@"result"]  isEqual:  @(YES)]){
            [self dismissViewControllerAnimated:YES completion:nil];
        }else{
            NSLog(@"注册失败!");
        }
    }];
}

@end
