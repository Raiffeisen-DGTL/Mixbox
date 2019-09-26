Pod::Spec.new do |s|
  s.name                   = 'MixboxTestability'
  s.module_name            = 'MixboxTestability'
  s.version                = '0.2.3'
  s.summary                = 'MixboxTestability makes your UI more testable'
  s.homepage               = 'https://github.com/avito-tech/Mixbox'
  s.license                = 'MIT'
  s.author                 = { 'Hive of coders from Avito' => 'avito.ru' }
  s.source                 = { :git => 'https://github.com/antigp/Mixbox.git', :branch => "antigp"  }
  s.platform               = :ios, '9.0'
  s.ios.deployment_target = '9.0'
  s.swift_version = '4.2'
  s.requires_arc = true
  s.source_files = 'Frameworks/Testability/**/*.{swift,h,m}'
end
