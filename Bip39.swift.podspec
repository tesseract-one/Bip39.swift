Pod::Spec.new do |s|
  s.name             = 'Bip39.swift'
  s.version          = '0.0.1'
  s.summary          = 'Cross-platform BIP39 mnemonic implementation for Swift.'

  s.description      = <<-DESC
Cross-platform BIP39 mnemonic implementation for Swift. Supports all Apple platforms and Linux.
                       DESC

  s.homepage         = 'https://github.com/tesseract-one/Bip39.swift'

  s.license          = { :type => 'Apache 2.0', :file => 'LICENSE' }
  s.author           = { 'Tesseract Systems, Inc.' => 'info@tesseract.one' }
  s.source           = { :git => 'https://github.com/tesseract-one/Bip39.swift.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'
  s.osx.deployment_target = '10.10'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'
  
  s.swift_versions = ['5', '5.1', '5.2', '5.3']

  s.module_name = 'Bip39'

  s.source_files = 'Sources/Bip39/*.swift'
 
  s.test_spec 'Tests' do |test_spec|
    test_spec.platforms = {:ios => '9.0', :osx => '10.10', :tvos => '9.0'}
    test_spec.source_files = 'Tests/Bip39Tests/**/*.swift'
  end
end
