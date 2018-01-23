Pod::Spec.new do |s|
  s.name         = "ManualIndoorLocationProvider"
  s.version      = "1.0.1"
  s.license      = { :type => 'MIT' }
  s.summary      = "Allows to set an IndoorLocation manually"
  s.homepage     = "https://github.com/IndoorLocation/manual-indoor-location-provider-ios.git"
  s.author       = { "Indoor Location" => "indoorlocation@mapwize.io" }
  s.platform     = :ios
  s.ios.deployment_target = '6.0'
  s.source       = { :git => "https://github.com/IndoorLocation/manual-indoor-location-provider-ios.git", :tag => "#{s.version}" }
  s.source_files  = "manual-indoorlocation-provider-ios/Provider/*.{h,m}"
  s.dependency "IndoorLocation", "~> 1.0"
end
