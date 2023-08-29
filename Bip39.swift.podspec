Pod::Spec.new do |s|
  s.name             = 'Bip39.swift'
  s.version          = '999.99.9'
  s.summary          = 'Cross-platform BIP39 mnemonic implementation for Swift.'

  s.description      = <<-DESC
Cross-platform BIP39 mnemonic implementation for Swift. Supports all Apple platforms and Linux.
                       DESC

  s.homepage         = 'https://github.com/tesseract-one/Bip39.swift'

  s.license          = { :type => 'Apache 2.0', :file => 'LICENSE' }
  s.author           = { 'Tesseract Systems, Inc.' => 'info@tesseract.one' }
  s.source           = { :git => 'https://github.com/tesseract-one/Bip39.swift.git', :tag => s.version.to_s }

  s.swift_version    = '5.4'

  base_platforms     = { :ios => '11.0', :osx => '10.13', :tvos => '11.0' }
  s.platforms        = base_platforms.merge({ :watchos => '6.0' })

  s.module_name      = 'Bip39'

  s.source_files     = 'Sources/Bip39/**/*.swift'
  
  s.dependency 'UncommonCrypto', '~> 0.2.0'
 
  s.test_spec 'Tests' do |ts|
    ts.platforms = base_platforms
    ts.source_files = 'Tests/Bip39Tests/**/*.swift'
  end
end
