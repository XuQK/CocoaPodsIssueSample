workspace 'MediationIOSPlugins'
project 'MediationIOSPluginsSample/MediationIOSPluginsSample.xcodeproj'

platform :ios, '14.0'
supports_swift_versions '5.0'
use_frameworks!

install! 'cocoapods',
         :generate_multiple_pod_projects => true,
         :disable_input_output_paths => true

pod 'UMPCore', :path => './UMPCore/UMPCore.podspec'


target 'MediationIOSPluginsSample' do
  pod 'UMPApplovin', :path => 'UMPApplovin'

  target 'MediationIOSPluginsSampleTests' do
    inherit! :search_paths
  end

  target 'MediationIOSPluginsSampleUITests' do
  end
end

post_install do |installer|
  installer.generated_projects.each do |project|
    project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['SWIFT_OBJC_INTEROP_MODE'] = 'objcxx'
        config.build_settings['SWIFT_VERSION'] = '5.0'
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '14.0'
      end
    end
  end
end
