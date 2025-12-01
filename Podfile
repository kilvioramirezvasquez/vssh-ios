platform :ios, '15.0'

target 'VSSHKR' do
  use_frameworks!

  # SSH library for iOS (equivalent to JSch in Android)
  pod 'NMSSH', '~> 2.3'

  # Force all pods to use iOS 15.0 deployment target
  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '15.0'
      end
    end
  end
end

