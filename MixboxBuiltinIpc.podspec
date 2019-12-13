Pod::Spec.new do |s|
  s.name                   = 'MixboxBuiltinIpc'
  s.module_name            = s.name
  s.version                = '0.2.3'
  s.summary                = s.name
  s.homepage               = 'https://github.com/avito-tech/Mixbox'
  s.license                = 'MIT'
  s.author                 = { 'Hive of coders from Avito' => 'avito.ru' }
  s.source                 = { :git => 'https://github.com/Raiffeisen-DGTL/Mixbox.git',  :branch => "removeSBTUI" }
  s.ios.deployment_target  = "9.0"
  s.osx.deployment_target = "10.14"
  s.swift_version = '5.0'
  s.requires_arc           = true
  s.source_files           = 'Frameworks/BuiltinIpc/Sources/**/*.{swift,h,m,mm}'
  
  s.dependency 'MixboxIpc'
  s.dependency 'GCDWebServer'
end
