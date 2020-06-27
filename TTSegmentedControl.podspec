Pod::Spec.new do |s|

# 1
s.platform = :ios
s.ios.deployment_target = '11.0'
s.license = 'MIT'
s.name = "TTSegmentedControl"
s.summary = "An elegant, animated and customizable segmented control for iOS."
s.requires_arc = true
s.version = "0.4.11"
s.author = { "Ram Sundaram" => "ram@jyroo.com" }
s.homepage = "https://jyroo.com/"
s.framework = "UIKit"
s.source = { :git => 'https://github.com/ramjyroo/TTSegmentedControl-jyroo.git', :tag => s.version }
s.source_files = 'TTSegmentedControl/*.{swift}'
s.pod_target_xcconfig = { 'SWIFT_VERSION' => '5.0' }

end
