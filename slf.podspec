Pod::Spec.new do |s|
  s.name = 'slf'
  s.version = '0.1.0'
  s.license = 'MIT'
  s.summary = 'Swift Logging Facade'
  s.homepage = 'https://github.com/mrfripp/slf'
  s.authors = { 'Fredrik Pettersson' => 'fredrik.lars.pettersson@gmail.com' }
  s.source = { :git => 'https://github.com/mrfripp/slf.git', :tag => '0.1.0' }

  s.ios.deployment_target = '9.0'
  s.osx.deployment_target = '10.11'
  s.tvos.deployment_target = '9.0'

  s.source_files = 'Sources/slf/**/*.swift'

  s.requires_arc = true

  s.subspec 'SimpleLogger' do |sp|
    sp.source_files = 'Sources/SimpleLogger/**/*.swift'
  end

end
