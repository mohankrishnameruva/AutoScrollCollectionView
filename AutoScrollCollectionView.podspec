#
# Be sure to run `pod lib lint AutoScrollCollectionView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AutoScrollCollectionView'
  s.version          = '1.0.1'
  s.summary          = 'Using this pod you can scroll your collectionView Continuously at specific time intervals'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
For scrolling the collection view to next visible item continuosly and automatically after specific time intervals. You can directly subclass the AutoScrollCollectionView class in the storyboard and call the method collectionView.startAutoScrollView() to start the scrolling and you can call collectionView.stopAutoScrolling() when you need it to stop
                       DESC

  s.homepage         = 'https://github.com/mohankrishnameruva/AutoScrollCollectionView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Mohan Meruva' => 'mohanmeruva989@gmail.com' }
  s.source           = { :git => 'https://github.com/mohankrishnameruva/AutoScrollCollectionView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'AutoScrollCollectionView/Classes/**/*'
  s.swift_version = '5.0'
  # s.resource_bundles = {
  #   'AutoScrollCollectionView' => ['AutoScrollCollectionView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
