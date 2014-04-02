Pod::Spec.new do |s|
  s.name             = "MLUIKitAdditions"
  s.version          = "0.0.1"
  s.summary          = "Lite framework with some helpful categories over UIKit classes."
  s.homepage         = "https://github.com/miguellara/MLUIKitAdditions.git"
  s.license          = 'MIT'
  s.author           = { "Miguel Lara" => "miguel@mac.com" }
  s.source           = { :git => "https://github.com/miguellara/MLUIKitAdditions.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/bigbrowntheory'

  s.ios.deployment_target = '7.0'
  s.requires_arc = true

  s.source_files = 'MLUIKitAdditions/**/*.{h,m}'
  s.frameworks = 'UIKit', 'XCTest'
end
