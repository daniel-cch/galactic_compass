#import "GalacticCompassPlugin.h"
#if __has_include(<galactic_compass/galactic_compass-Swift.h>)
#import <galactic_compass/galactic_compass-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "galactic_compass-Swift.h"
#endif

@implementation GalacticCompassPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftGalacticCompassPlugin registerWithRegistrar:registrar];
}
@end
