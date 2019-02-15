
Pod::Spec.new do |s|

  s.name         = "File"
  s.version      = "0.0.1"
  s.summary      = "iOS FileManager Extension."
  s.homepage     = "https://github.com/Fidetro/File"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "fidetro" => "zykzzzz@hotmail.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/Fidetro/File.git", :tag => "0.0.1" }
  s.source_files = "Sources/*.{swift}"

end
