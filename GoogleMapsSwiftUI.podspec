#
#  Be sure to run `pod spec lint GoogleMapsSwiftUI.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|
  
  spec.name                   = "GoogleMapsSwiftUI"
  spec.version                = "0.0.1"
  spec.summary                = "SwiftUI wrapper for GoogleMaps SDK"

  spec.description            = "SwiftUI wrapper for GoogleMaps SDK"

  spec.homepage     = "https://github.com/purenative/googlemaps.swiftui"
  # spec.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"

  spec.license      = "MIT"
  # spec.license      = { :type => "MIT", :file => "FILE_LICENSE" }

  spec.author             = { "Artem Eremeev" => "jeremy1002@yandex.ru" }
  # Or just: spec.author    = "Artem Eremeev"
  # spec.authors            = { "Artem Eremeev" => "jeremy1002@yandex.ru" }
  # spec.social_media_url   = "https://twitter.com/Artem Eremeev"

  spec.platform               = :ios
  spec.ios.deployment_target  = '14.0'

  spec.source       = { :git => "https://github.com/purenative/googlemaps.swiftui.git", 
                        :tag => "#{spec.version}" }

  spec.source_files  = "GoogleMapsSwiftUI/**/*.{h,m,swift}"
  # spec.exclude_files = "Classes/Exclude"

  # spec.public_header_files = "Classes/**/*.h"

  # spec.resource  = "icon.png"
  # spec.resources = "Resources/*.png"

  # spec.preserve_paths = "FilesToSave", "MoreFilesToSave"

  # spec.framework  = "SomeFramework"
  # spec.frameworks = "SomeFramework", "AnotherFramework"

  # spec.library   = "iconv"
  # spec.libraries = "iconv", "xml2"

  spec.requires_arc = true

  spec.dependency 'GoogleMaps', '7.4.0'
  spec.dependency 'Google-Maps-iOS-Utils', '4.2.2'

  spec.swift_version = "5.7"

end
