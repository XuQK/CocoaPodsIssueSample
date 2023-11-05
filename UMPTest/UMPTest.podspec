Pod::Spec.new do |s|
  s.name             = 'UMPTest'
  s.version          = '0.0.1-alpha.1'
  s.swift_version    = '5.0'
  s.summary          = 'Unity Mediation iOS Plugin For Test'
  s.description      = <<-DESC
Unity Mediation iOS Plugin For Test.
                       DESC
  s.homepage         = 'https://稍后确定'
  # s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'XuQK'         => 'xuqiankun@amberweather.com',
                         'daven'        => 'gongwen@amberweather.com',
                         'zhangshichen' => 'zhangshichen@amberweather.com' }
  s.source = { :http => "http://august.amberweather.com:8081/nexus/content/repositories/unity-internal/#{s.name}/-/#{s.name}-#{s.version}.tgz" }
  s.source_files = 'UMPTest/**/*.{h,m,cpp,hpp,swift}'
#  s.vendored_frameworks = "#{s.name}.xcframework"
  s.platform = :ios, '14.0'
end
