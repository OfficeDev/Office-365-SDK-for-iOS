Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.name         = "Office365"
  s.version      = "0.5.0"
  s.summary      = "Client libraries for calling Office 365 service APIs from iOS apps."

  s.description  = <<-DESC
		   Client libraries for calling Office 365 service APIs from iOS apps.
		   Libraries are generated from OData CSDL files.
		   Work is in progress.
                   DESC

  s.homepage     = "http://github.com/OfficeDev/Office-365-SDK-for-iOS"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.license      = "Apache License, Version 2.0"


  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.author             = { "joshgav" => "josh.gavant@microsoft.com" }
  # s.social_media_url   = "http://twitter.com/joshgav"

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.platform     = :ios
  s.ios.deployment_target = "6.0"


  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.source       = { :git => "https://github.com/OfficeDev/Office-365-SDK-for-iOS.git", 
		     :tag => "v#{s.version}" 
		   }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.exclude_files = ""


  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  # s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

  # --- Subspecs ------------------------------------------------------------------#

  s.subspec 'OData' do |subspec|
     subspec.source_files  = "sdk-objectivec/office365_odata_base/**/*.{h,m}"
     subspec.public_header_files = "sdk-objectivec/office365_odata_base/**/*.h"
  end

  s.subspec 'Outlook' do |subspec|
     subspec.source_files = "sdk-objectivec/office365_exchange_sdk/**/*.{h,m}"
     subspec.dependency "Office365/OData"
     subspec.public_header_files = "sdk-objectivec/office365_exchange_sdk/**/*.h"
  end

  s.subspec 'Files' do |subspec|
     subspec.source_files = "sdk-objectivec/office365_drive_sdk/**/*.{h,m}"
     subspec.dependency "Office365/OData"
     subspec.public_header_files = "sdk-objectivec/office365_drive_sdk/**/*.h"
  end

  s.subspec 'Directory' do |subspec|
     subspec.source_files = "sdk-objectivec/office365_directory_sdk/**/*.{h,m}"
     subspec.dependency "Office365/OData"
     subspec.public_header_files = "sdk-objectivec/office365_directory_sdk/**/*.h"
  end

  s.subspec 'Discovery' do |subspec|
     subspec.source_files = "sdk-objectivec/office365_discovery_sdk/**/*.{h,m}"
     subspec.dependency "Office365/OData"
     subspec.public_header_files = "sdk-objectivec/office365_discovery_sdk/**/*.h"
  end

  s.subspec 'Lists' do |subspec|
     subspec.source_files = "sdk-objectivec/office365-lists-sdk/**/*.{h,m}"
     subspec.public_header_files = "sdk-objectivec/office365-lists-sdk/**/*.h"
  end
end
