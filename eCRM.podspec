Pod::Spec.new do |s|
  s.name             = 'eCRMSDK'
  s.version          = '0.0.1'
  s.summary          = 'Use SDK for detect face'
  s.description      = 'Use SDK for detect face. This used for almost faces'
  s.homepage         = 'https://github.com/facecrm/facecrm-ios-sdk'
  
  s.author           = { 'Michael Thompson' => 'hoangsonit1607@gmail.com' }
  s.license          = { :type => 'BSD', :file => 'LICENSE' }
  
  
  s.source           = { :http => 'https://github.com/facecrm/facecrm-ios-sdk/archive/' + s.version.to_s + '.zip' }   
  s.platform         = :ios
  s.ios.deployment_target = '10.0'
  s.ios.vendored_frameworks = 'eCRM.framework'


  # s.swift_version    = '4.2'

  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'  
  # s.resource_bundles = {
  #   'APFaceSDK' => ['APFaceSDK/Assets/*.png']
  # }
  # s.resource
  # s.frameworks = 'UIKit', 'MapKit'
  

# s.source_files = 'APFaceSDK/Classes/*.swift'
# s.public_header_files = 'Pod/Classes/**/*.h'

# s.ios.weak_frameworks     = 'PushKit'
# s.requires_arc            = true
# s.dependency 'AFNetworking', '~> 2.3'
end
