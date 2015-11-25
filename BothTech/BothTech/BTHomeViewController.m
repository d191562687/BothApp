//
//  BTHomeViewController.m
//  BothTech
//
//  Created by lanhull on 15/11/24.
//  Copyright © 2015年 bothtech. All rights reserved.
//

#import "BTHomeViewController.h"
#import "PopMenu.h"
#import "ViewController.h"

@interface BTHomeViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *IconView;

@property (nonatomic, copy) DidSelectedItemBlock didSelectedItemCompletion;

@property (strong, nonatomic) PopMenu * popMenu;

@end

@implementation BTHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showMenu {
    NSMutableArray *items = [[NSMutableArray alloc] initWithCapacity:4];
    
    MenuItem *menuItem = [MenuItem itemWithTitle:@"Flickr" iconName:@"post_type_bubble_flickr"];
    [items addObject:menuItem];
    
    menuItem = [MenuItem itemWithTitle:@"Googleplus" iconName:@"post_type_bubble_googleplus" glowColor:[UIColor colorWithRed:0.840 green:0.264 blue:0.208 alpha:0.800]];
    [items addObject:menuItem];
    
    menuItem = [MenuItem itemWithTitle:@"Instagram" iconName:@"post_type_bubble_instagram" glowColor:[UIColor colorWithRed:0.232 green:0.442 blue:0.687 alpha:0.800]];
    [items addObject:menuItem];
    
    menuItem = [MenuItem itemWithTitle:@"Twitter" iconName:@"post_type_bubble_twitter" glowColor:[UIColor colorWithRed:0.000 green:0.509 blue:0.687 alpha:0.800]];
    [items addObject:menuItem];
    
    menuItem = [MenuItem itemWithTitle:@"Youtube" iconName:@"post_type_bubble_youtube" glowColor:[UIColor colorWithRed:0.687 green:0.164 blue:0.246 alpha:0.800]];
    [items addObject:menuItem];
    
    menuItem = [MenuItem itemWithTitle:@"Facebook" iconName:@"post_type_bubble_facebook" glowColor:[UIColor colorWithRed:0.258 green:0.245 blue:0.687 alpha:0.800]];
    [items addObject:menuItem];
    
    menuItem = [MenuItem itemWithTitle:@"Facebook" iconName:@"post_type_bubble_facebook" glowColor:[UIColor colorWithRed:0.258 green:0.245 blue:0.687 alpha:0.800]];
    [items addObject:menuItem];
    
    menuItem = [MenuItem itemWithTitle:@"Facebook" iconName:@"post_type_bubble_facebook" glowColor:[UIColor colorWithRed:0.258 green:0.245 blue:0.687 alpha:0.800]];
    [items addObject:menuItem];
    
    if (!_popMenu) {
        _popMenu = [[PopMenu alloc] initWithFrame:self.view.bounds items:items];
        _popMenu.menuAnimationType = kPopMenuAnimationTypeNetEase;
    }
    if (_popMenu.isShowed) {
        return;
    }
    _popMenu.didSelectedItemCompletion = ^(MenuItem *selectedItem) {
        NSLog(@"%@",selectedItem.title);
        
        ViewController *WebView = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ViewController"];
        [WebView view];
        
        
        WebView.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        [self presentModalViewController:WebView animated:YES];

        
    };
    
    [_popMenu showMenuAtView:self.view];
    
    //    [_popMenu showMenuAtView:self.view startPoint:CGPointMake(CGRectGetWidth(self.view.bounds) - 60, CGRectGetHeight(self.view.bounds)) endPoint:CGPointMake(60, CGRectGetHeight(self.view.bounds))];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [self showMenu];
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
