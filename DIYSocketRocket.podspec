Pod::Spec.new do |s|
  s.name               = "DIYSocketRocket"
  s.version            = '0.2.2'
  s.summary            = 'A conforming WebSocket (RFC 6455) client library, now sans asserts.'
  s.homepage           = 'https://github.com/diy/SocketRocket'
  s.authors            = 'Square'
  s.license            = 'Apache License, Version 2.0'
  s.source             = { :git => 'https://github.com/diy/SocketRocket.git', :tag => 'v0.2.2'}
  s.source_files       = 'SocketRocket/*.{h,m,c}'
  s.requires_arc       = true
  s.ios.frameworks     = %w{CFNetwork Security}
  s.osx.frameworks     = %w{CoreServices Security}
  s.libraries          = "icucore"
end
