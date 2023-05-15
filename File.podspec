
Pod::Spec.new do |s|

  s.name         = "File"
  s.version      = "0.0.2"
  s.summary      = "iOS FileManager Extension."
  s.homepage     = "https://github.com/Fidetro/File"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "fidetro" => "zykzzzz@hotmail.com" }
  s.ios.deployment_target  = '8.0'
  s.osx.deployment_target  = '10.9'
  s.source       = { :git => "https://github.com/Fidetro/File.git", :tag => "#{s.version}" }
  s.source_files = "Sources/*.{swift}"

end
