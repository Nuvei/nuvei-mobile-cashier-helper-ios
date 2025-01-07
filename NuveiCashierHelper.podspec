Pod::Spec.new do |s|
  s.name                        = "NuveiCashierHelper"
  s.version                     = '3.4'
  s.summary                     = "NuveiCashierHelper"
  s.description                 = <<-DESC
                                   Nuvei Cashier Helper Library
                                  DESC
  s.homepage                    = "https://github.com/Nuvei/nuvei-mobile-cashier-helper-ios"
  s.license                     = 'Commercial license'
  s.author                      = "Nuvei"
  s.source                      = { :git => "https://github.com/Nuvei/nuvei-mobile-cashier-helper-ios", :tag => s.version.to_s }
  s.platform                    = :ios, '13.4'
  s.requires_arc                = true
  s.ios.deployment_target       = "10.0"
  s.swift_version               = '5.1'
  s.libraries                   = 'z'
  s.vendored_frameworks         = "NuveiCashierHelper.xcframework"
  s.frameworks                  = 'UIKit','WebKit'
end
