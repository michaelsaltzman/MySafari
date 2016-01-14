//
//  WebViewViewController.m
//  MySafari
//
//  Created by Michael Saltzman on 1/12/16.
//  Copyright © 2016 Michael Saltzman. All rights reserved.
//

#import "WebViewViewController.h"

@interface WebViewViewController () <UIWebViewDelegate, UITextFieldDelegate>;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UITextField *urlTextField;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *networkSpinner;

@end

@implementation WebViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.networkSpinner.hidden = YES;
    
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [self.networkSpinner stopAnimating];
    self.networkSpinner.hidden = YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    [self.networkSpinner startAnimating];
    self.networkSpinner.hidden = NO;
}

- (IBAction)onBackButtonPressed:(id)sender {
    if (self.webView.canGoBack == YES) {
    [self.webView goBack];
    [sender setEnabled: YES];
    }
    else {
        [sender setEnabled: NO];
    }
}

- (IBAction)onForwardButtonPressed:(id)sender {
    [self.webView goForward];
}

- (IBAction)onStopLoadingButtonPressed:(id)sender {
    [self.webView stopLoading];
}

- (IBAction)onReloadButtonPressed:(id)sender {
    [self.webView reload];
}

- (IBAction)onPlusButtonPressed:(id)sender {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Coming soon!"
                                                                             message:@"Fuck coding"
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"Move on bro"
                                                          style:(UIAlertActionStyleDefault)
                                                        handler:^(UIAlertAction * _Nonnull action) {
                                                            //
                                                        }];
    
    [alertController addAction:alertAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}



- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (![self.urlTextField.text containsString:@"http://"]) {
        self.urlTextField.text = [[NSString stringWithFormat:@"http://"] stringByAppendingString:self.urlTextField.text];
    }
    
    NSURL *url = [NSURL URLWithString:self.urlTextField.text];
    NSURLRequest *requestUrl = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:requestUrl];
    return YES;
}
@end

