Pod::Spec.new do |s|
  s.name             = 'UMPApplovin'
  s.version          = '0.0.1-alpha.1'
  s.swift_version    = '5.0'
  s.summary          = 'Unity Mediation iOS Plugin For Applovin'
  s.description      = <<-DESC
Unity Mediation iOS Plugin For Applovin.
                       DESC
  s.homepage         = 'https://稍后确定'
  s.author           = { 'XuQK'         => 'fake@email.com' }
  s.source = { :git => '' }
  s.source_files = 'UMPApplovin/**/*.*'
  s.platform = :ios, '14.0'
  s.dependency 'UMPCore'
end
