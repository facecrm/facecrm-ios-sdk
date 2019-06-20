Pod::Spec.new do |s|
  s.name             = 'FaceCRM'
  s.version          = '0.0.5'
  s.summary          = 'Use SDK for detect face'
  s.homepage         = 'https://github.com/facecrm/facecrm-ios-sdk'
  
  s.author           = { 'Michael Thompson' => 'hoangsonit1607@gmail.com' }
  s.license          = { :type => 'BSD', :file => 'LICENSE' }
  
  s.source           = { :git => "https://github.com/facecrm/facecrm-ios-sdk.git", :tag => s.version.to_s }
   
  s.platform         = :ios
  s.ios.deployment_target = '10.0'
  s.swift_version    = '4.2'
  s.ios.vendored_frameworks = 'FaceCRM.framework'

  #s.dependency 'Alamofire'

end
