platform :ios, '15.0'

target 'VSSHKR' do
  use_frameworks!

  # SSH library for iOS (equivalent to JSch in Android)
  pod 'NMSSH', '~> 2.3'

  # Force all pods to use iOS 15.0 deployment target
  # Disable code signing for pods (required for archive without signing)
  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '15.0'
        config.build_settings['CODE_SIGN_IDENTITY'] = ''
        config.build_settings['CODE_SIGNING_REQUIRED'] = 'NO'
        config.build_settings['CODE_SIGNING_ALLOWED'] = 'NO'
      end
    end
  end
end

