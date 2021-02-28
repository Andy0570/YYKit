Pod::Spec.new do |s|
  s.name         = 'YYKit'
  s.summary      = 'A collection of iOS components.'
  s.version      = '1.0.9'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.authors      = { 'ibireme' => 'ibireme@gmail.com' }
  s.social_media_url = 'http://blog.ibireme.com'
  s.homepage     = 'https://github.com/ibireme/YYKit'
  s.platform     = :ios, '9.0'
  s.ios.deployment_target = '9.0'
  s.source       = { :git => 'https://github.com/ibireme/YYKit.git', :tag => s.version.to_s }
  
  s.requires_arc = true
  #s.source_files = 'YYKit/**/*.{h,m}'
  #s.public_header_files = 'YYKit/**/*.{h}'

  ########################################################
  s.source_files = 'YYKit/YYKit.h'

  # Base
  s.subspec 'Base' do |base|
    base.source_files = 'YYKit/Base/YYKitMacro.h'
    base.subspec 'Foundation' do |foundation|
      foundation.source_files = 'YYKit/Base/Foundation/*.{h,m}'
    end
    base.subspec 'UIKit' do |uikit|
      uikit.source_files = 'YYKit/Base/UIKit/*.{h,m}'
    end
    base.subspec 'Quartz' do |quartz|
      quartz.source_files = 'YYKit/Base/Quartz/*.{h,m}'
    end
  end

  # Model
  s.subspec 'Model' do |model|
    model.source_files = 'YYKit/Model/*.{h,m}'
  end

  # Cache
  s.subspec 'Cache' do |cache|
    cache.source_files = 'YYKit/Cache/*.{h,m}'
  end

  # Image
  s.subspec 'Image' do |image|
    image.source_files = 'YYKit/Image/*.{h,m}'
    image.subspec 'Categories' do |cateogries|
      cateogries.source_files = 'YYKit/Image/Categories/*.{h,m}'
    end
  end

  # Text
  s.subspec 'Text' do |text|
    text.source_files = 'YYKit/Text/*.{h,m}'
    text.subspec 'String' do |string|
      string.source_files = 'YYKit/Text/String/*.{h,m}'
    end
    text.subspec 'Component' do |component|
      component.source_files = 'YYKit/Text/Component/*.{h,m}'
    end
  end

  # Utility
  s.subspec 'Utility' do |utility|
    utility.source_files = 'YYKit/Utility/*.{h,m}'
  end
  ########################################################

  non_arc_files = 'YYKit/Base/Foundation/NSObject+YYAddForARC.{h,m}', 'YYKit/Base/Foundation/NSThread+YYAdd.{h,m}'
  s.ios.exclude_files = non_arc_files
  s.subspec 'no-arc' do |sna|
    sna.requires_arc = false
    sna.source_files = non_arc_files
  end

  s.libraries = 'z', 'sqlite3'
  s.frameworks = 'UIKit', 'CoreFoundation', 'CoreText', 'CoreGraphics', 'CoreImage', 'QuartzCore', 'ImageIO', 'AssetsLibrary', 'Accelerate', 'MobileCoreServices', 'SystemConfiguration'
  s.ios.vendored_frameworks = 'Vendor/WebP.framework'

end
