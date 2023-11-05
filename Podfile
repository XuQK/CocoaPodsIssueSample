workspace 'MediationIOSPlugins'
project 'MediationIOSPluginsSample/MediationIOSPluginsSample.xcodeproj'

platform :ios, '14.0'
supports_swift_versions '5.0'
use_frameworks!

install! 'cocoapods',
         :generate_multiple_pod_projects => true,
         :disable_input_output_paths => true

#pod 'UMPCore', :path => 'UMPCore'

target 'MediationIOSPluginsSample' do
  pod 'UMPTest', :path => 'UMPTest'
#  pod 'UMPApplovin', :path => 'UMPApplovin'

  target 'MediationIOSPluginsSampleTests' do
    inherit! :search_paths
  end

  target 'MediationIOSPluginsSampleUITests' do
  end
end

# 安装完成后，对 Build Settings 做一些必要修改
post_install do |installer|
  # installer.generated_projects.each do ||
  # installer.development_pod_targets.each do |target|
  #   # target.build_configurations.each do |config|
  #   target.user_build_configurations.each do |k, v|
  #     puts "a:#{k} -> #{v}"
  #   end

  #     puts "修改开始: #{target} - "
  #         target.instance_variables.each do |vn|
  #           puts "变量 #{vn}"
  #         end
  #         target.public_method.each do |vn|
  #           puts "方法 #{vn}"
  #         end
  #     # # 将所有项目的 C++ and Objective-C Interoperability 修改为 C++ / Objective-C++
  #     # config.build_settings['SWIFT_OBJC_INTEROP_MODE'] = 'objcxx'
  #     # # 将所有项目的 SWIFT Language Version 修改为 Swift 5
  #     # target.swift_version = "5.0"
  #     # config.build_settings['SWIFT_VERSION'] = '5.0'
  #     # # 将 iOS Deployment Target 改为 iOS 14.0
  #     # config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '14.0'
  #     puts "修改结束: #{target} - "
  #   # end
  # end

  installer.generated_projects.each do |project|
    project.targets.each do |target|
      target.build_configurations.each do |config|
        # 将所有项目的 C++ and Objective-C Interoperability 修改为 C++ / Objective-C++
        config.build_settings['SWIFT_OBJC_INTEROP_MODE'] = 'objcxx'
        # 将所有项目的 SWIFT Language Version 修改为 Swift 5
        config.build_settings['SWIFT_VERSION'] = '5.0'
        # 将 iOS Deployment Target 改为 iOS 14.0
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '14.0'
      end
    end
  end
end

def putsVariableAndMethod(obj)
  puts "##### 打印变量和方法 start #{obj} #####"

  # 获取属性名称列表，并遍历
  obj.instance_variables.each do |variableName|
    # 打印属性名称
    puts "属性名：#{variableName}"
  end

  # 获取方法名称列表，并遍历
  obj.public_methods.each do |method|
    # 打印方法名称
    puts "方法名：#{method}"
  end
  puts "##### 打印变量和方法 end #{obj} #####"
end
