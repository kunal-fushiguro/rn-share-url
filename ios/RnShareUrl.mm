#import "RnShareUrl.h"
#import <React/RCTUtils.h>
#import <UIKit/UIKit.h>

@implementation RnShareUrl
RCT_EXPORT_MODULE()

- (void)shareUrl:(NSString *)url {
  dispatch_async(dispatch_get_main_queue(), ^{
    NSURL *shareURL = [NSURL URLWithString:url];
    NSArray *items = @[shareURL];

    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:items applicationActivities:nil];

    UIViewController *rootVC = RCTPresentedViewController();
    [rootVC presentViewController:activityVC animated:YES completion:nil];
  });
}


- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:
    (const facebook::react::ObjCTurboModule::InitParams &)params
{
    return std::make_shared<facebook::react::NativeRnShareUrlSpecJSI>(params);
}

@end
