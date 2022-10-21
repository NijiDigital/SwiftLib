Pod::Spec.new do |s|
  s.name             = 'NijiLib'
  s.version          = '0.0.3'
  s.summary          = 'Librairie de Niji pour les extensions courantes.'
  s.homepage         = 'https://github.com/NijiDigital/NijiLib'
  s.license          = { :type => 'MIT', :file => 'LICENSE.md' }
  s.author           = { 'GuillaumeC' => 'https://github.com/GuillaumeC26351' }
  s.source           = { :git => 'https://github.com/NijiDigital/NijiLib.git',
                         :tag => s.version.to_s }
  s.ios.deployment_target = '13.0'
  s.swift_version = '5.0'
  s.source_files = 'Sources/NijiLib/**/*'
end