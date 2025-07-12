#import "RnShareUrl.h"
#import <React/RCTUtils.h>
#import <UIKit/UIKit.h>

@implementation RnShareUrl
RCT_EXPORT_MODULE()

- (void)shareUrl:(NSString *)url {
  dispatch_async(dispatch_get_main_queue(), ^{
    if (url == nil || [url length] == 0) {
      NSLog(@"[ShareError] URL string is nil or empty.");
      return;
    }

    NSURL *shareURL = [NSURL URLWithString:url];
    if (shareURL == nil) {
      NSLog(@"[ShareError] Failed to create NSURL from string: %@", url);
      return;
    }

    NSArray *items = @[shareURL];
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:items applicationActivities:nil];

    UIViewController *rootVC = RCTPresentedViewController();
    if (rootVC == nil) {
      NSLog(@"[ShareError] Failed to get root view controller.");
      return;
    }

    if (rootVC.presentedViewController) {
      NSLog(@"[ShareWarning] Root view controller is already presenting another view controller.");
    }

    [rootVC presentViewController:activityVC animated:YES completion:^{
      NSLog(@"[ShareInfo] UIActivityViewController presented successfully.");
    }];
  });
}



- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:
    (const facebook::react::ObjCTurboModule::InitParams &)params
{
    return std::make_shared<facebook::react::NativeRnShareUrlSpecJSI>(params);
}

@end
