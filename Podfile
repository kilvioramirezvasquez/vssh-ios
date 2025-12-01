# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'

workspace 'VSSHKR'

target 'VSSHKR' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # SSH library for iOS (equivalent to JSch in Android)
  pod 'NMSSH', '~> 2.3'

  # Note: SwiftTerm removed - may not be available as CocoaPod
  # Terminal emulation will be handled by NMSSH's built-in terminal support

  target 'VSSHKRTests' do
    inherit! :search_paths
    # Pods for testing
  end

end

