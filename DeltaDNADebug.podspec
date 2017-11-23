Pod::Spec.new do |s|
  s.name             = 'DeltaDNADebug'
  s.version          = '1.0.0'
  s.summary          = 'Diagnostics for deltaDNA SDKs.'

  s.description      = <<-DESC
deltaDNA debug exposes the behaviour of the SmartAds library so you can know which ad is showing on screen.
                       DESC

  s.homepage = 'https://www.deltadna.com'
  s.license = { :type => 'APACHE', :file => 'LICENSE' }
  s.authors = { 'David White' => 'david.white@deltadna.com' }
  s.source = { :git => 'https://github.com/deltaDNA/ios-debug-sdk.git', :tag => s.version.to_s }

  s.requires_arc = true
  s.platform = :ios, '10.0'
  s.weak_frameworks = 'UserNotifications', 'UIKit'

  s.source_files = 'DeltaDNADebug/Classes/**/*'
  
  s.resource_bundles = {
    'DeltaDNADebug' => ['DeltaDNADebug/Assets/*.storyboard']
  }

end
