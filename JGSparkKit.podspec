#
# Be sure to run `pod spec lint NAME.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# To learn more about the attributes see http://docs.cocoapods.org/specification.html
#
Pod::Spec.new do |s|
  s.name         = "JGSparkKit"
  s.version      = "0.0.1"
  s.summary      = "A little wrapper for the Spark Cloud API"
  s.description  = <<-DESC
                    This is a quick wrapper I wrote for the Spark Cloud API - to power Spark Cores for fun, profit, and creating dangerous internet-of-things connect robots!
                   DESC
  s.homepage     = "https://github.com/jongd/JGSparkKit"
  s.license      = 'MIT'
  s.author       = { "Jon Gold" => "hello@designedbygold.com" }
  s.source       = { :git => "https://github.com/jongd/JGSparkKit.git", :tag => s.version.to_s }


  s.platform     = :ios, '6.0'
  s.ios.deployment_target = '6.0'
  s.requires_arc = true

  s.source_files = 'Classes'
  s.resources = 'Assets'

  # s.public_header_files = 'Classes/**/*.h'
  # s.frameworks = 'SomeFramework', 'AnotherFramework'
  s.dependency 'AFNetworking', '~> 2.1'
end
