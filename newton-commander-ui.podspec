Pod::Spec.new do |s|
  s.name         = "newton-commander-ui"
  s.version      = "0.1.6"
  s.summary      = "The UI controls that is used throughout the Newton Commander app"
  s.description  = <<-DESC
    Content:
    - Homemade UI controls
    - 3rd party UI controls that are slightly adjusted for Newton Commander
    - 3rd party UI controls that have not been altered
    DESC
  s.homepage     = "https://github.com/neoneye/newton-commander-ui"
  s.screenshots  = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license      = 'MIT'
  s.author       = { "Simon Strandgaard" => "simon@opcoders.com" }
  s.source       = { :git => "https://github.com/neoneye/newton-commander-ui.git", :tag => s.version.to_s }

  s.platform     = :osx, '10.9'
  s.osx.deployment_target = '10.9'
  s.requires_arc = true

  s.source_files = 'Classes/osx/*.{h,m}'
  s.resource_bundles = { 'NewtonCommanderUI' => "NewtonCommanderUIBundle/*" }
  s.resources    = 'Assets/*.png'

  s.ios.exclude_files = 'Classes/osx'
  s.osx.exclude_files = 'Classes/ios', 'Classes/osx/*Test.*'
  s.public_header_files = 'Classes/osx/*.h'
  s.frameworks = 'Cocoa', 'WebKit'
  s.dependency 'newton-commander-browse'
end
