Pod::Spec.new do |s|
  s.name             = 'QBIndicatorButton'
  s.version          = '0.1.6'
  s.summary          = 'Custom of UIButton in Swift'

  s.description      = <<-DESC
Activity Indicator UIButton library written in Swift
                       DESC

  s.homepage         = 'https://github.com/sjc-bui/QBIndicatorButton'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'sjc-bui' => 'bui@setjapan.co.jp' }
  s.source           = { :git => 'https://github.com/sjc-bui/QBIndicatorButton.git', :tag => s.version.to_s }

  s.ios.deployment_target = '11.0'
  s.swift_version = '5.0'
  s.source_files = 'QBIndicatorButton/Classes/**/*'
end
