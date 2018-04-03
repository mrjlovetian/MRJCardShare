#
# Be sure to run `pod lib lint MRJCardShare.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MRJCardShare'
  s.version          = '0.1.0'
  s.summary          = '策略模式开发组件,结合组件化开发'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/mrjlovetian/MRJCardShare'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'mrjlovetian@gmail.com' => 'mrjlovetian@gmail.com' }
  s.source           = { :git => 'https://github.com/mrjlovetian/MRJCardShare.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'MRJCardShare/Classes/**/*'
  
  # s.resource_bundles = {
  #   'MRJCardShare' => ['MRJCardShare/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
    s.dependency 'MRJRemarkTextView'
    s.dependency 'MRJInputView'
    s.dependency 'SDWebImage'
    s.dependency 'MRJ_QRCode'

end
