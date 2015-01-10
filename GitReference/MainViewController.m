//
//  MainViewController.m
//  GitReference
//
//  Created by Devin Eror on 1/7/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "MainViewController.h"

static CGFloat margin = 15;
static NSString * const Command = @"command";
static NSString * const Reference = @"reference";

@interface MainViewController ()

@end

@implementation MainViewController

//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:<#nibNameOrNil#> bundle:<#nibBundleOrNil#>];
//    if (self) {
//        (NSString)Devin Eror;
//    }
//    return self;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height -20)];
    
    CGFloat topMargin = 20;
    CGFloat widthMinusMargin = self.view.frame.size.width - 2 * margin;
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(margin, topMargin, widthMinusMargin, 20)];
    title.font = [UIFont boldSystemFontOfSize:20];
    title.text = @"GitRef";
    [scrollView addSubview:title];
    
    CGFloat top = topMargin + 20 + margin * 2;
    
    for (NSDictionary *gitCommand in [self gitCommands]) {
        
        NSString *command = gitCommand[Command];
        NSString *reference = gitCommand[Reference];
        
        UILabel*gitCommand = [[UILabel alloc] initWithFrame:CGRectMake(margin, top, self.view.frame.size.width - 2 * margin, 20)];
        gitCommand.font = [UIFont boldSystemFontOfSize:17];
        gitCommand.text = command;
        [scrollView addSubview:gitCommand];
        
        top += (20 + margin);
        
        CGFloat heightForReference = [self heightOfReferenceString:Reference];
        
        UILabel *gitReference = [[UILabel alloc] initWithFrame:CGRectMake(margin, top, self.view.frame.size.width - 2 * margin, heightForReference)];
        gitReference.numberOfLines = 0;
        gitReference.font = [UIFont systemFontOfSize:15];
        gitReference.text = reference;
        [scrollView addSubview:gitReference];
        
        top += (heightForReference + 2 * margin);
    }
    
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width, top);
}

- (NSArray *)gitCommands {
    
    return @[@{Command: @"git status", Reference: @": shows changed files."},
             @{Command: @"git diff", Reference: @": shows actual changes."},
             @{Command: @"git add", Reference: @": adds changed files to the commit."},
             @{Command: @"git commit -m \"comment\"", Reference: @": commits the changes."},
             @{Command: @"git push origin _branch_", Reference: @": pushes commits to the branch named _branch_."},
             @{Command: @"git log", Reference: @": displys progress log."},
             @{Command: @"git comment --amend", Reference: @": re-enter last commit comments."},
            ];
}

- (CGFloat)heightOfReferenceString:(NSString *)reference {
    
    CGRect bounding = [reference boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 2 * margin, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil];
    
    return bounding.size.height;
}

- (UIFont *)commandFont {
    return [UIFont boldSystemFontOfSize:17];
}
                       
- (UIFont *)referenceFont {
    return [UIFont boldSystemFontOfSize:15];
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
