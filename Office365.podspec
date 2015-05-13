Pod::Spec.new do |s|
  s.name         = "Office365"
  s.version      = "0.9.1"
  s.summary      = "Client libraries for calling Office 365 service APIs from iOS apps."
  s.description  = <<-DESC
		   Client libraries for calling Office 365 service APIs from iOS apps.
		   These libraries are in preview.
                   DESC
  s.homepage     = "http://github.com/OfficeDev/Office-365-SDK-for-iOS"
  s.license      = "Apache License, Version 2.0"
  s.author             = { "joshgav" => "josh.gavant@microsoft.com" }
  s.social_media_url   = "http://twitter.com/OpenAtMicrosoft"

  s.platform     = :ios
  s.ios.deployment_target = "7.0"
  s.source       = { :git => "https://github.com/OfficeDev/Office-365-SDK-for-iOS.git",
		             :tag => "v#{s.version}"
		           }
  s.exclude_files = "**/Build/**/*"
  s.requires_arc = true
  s.dependency "OrcEngine/Implementation"

  # --- Subspecs ------------------------------------------------------------------#

  s.subspec 'Outlook' do |subspec|
     subspec.source_files = "sdk-objectivec/office365_exchange_sdk/**/*.{h,m}"
     subspec.public_header_files = "sdk-objectivec/office365_exchange_sdk/**/*.h"
     subspec.header_dir = "office365_exchange_sdk"
  end

  s.subspec 'Files' do |subspec|
     subspec.source_files = "sdk-objectivec/office365_files_sdk/**/*.{h,m}"
     subspec.public_header_files = "sdk-objectivec/office365_files_sdk/**/*.h"
     subspec.header_dir = "office365_files_sdk"
  end

  s.subspec 'AADGraph' do |subspec|
     subspec.source_files = "sdk-objectivec/office365_directory_sdk/**/*.{h,m}"
     subspec.public_header_files = "sdk-objectivc/office365_directory_sdk/**/*.{h,m}"
     subspec.header_dir = "office365_directory_sdk"
  end

  s.subspec 'Discovery' do |subspec|
     subspec.source_files = "sdk-objectivec/office365_discovery_sdk/**/*.{h,m}"
     subspec.public_header_files = "sdk-objectivec/office365_discovery_sdk/**/*.h"
     subspec.header_dir = "office365_discovery_sdk"
  end

  s.subspec 'Lists' do |subspec|
     subspec.source_files = "sdk-objectivec/office365-lists-sdk/**/*.{h,m}"
     subspec.public_header_files = "sdk-objectivec/office365-lists-sdk/**/*.h"
     subspec.header_dir = "office365-lists-sdk"
  end

  s.subspec 'OneNote' do |subspec|
   subspec.source_files = "sdk-objectivec/office365_onenote_sdk/**/*.{h,m}"
   subspec.public_header_files = "sdk-objectivec/office365_onenote_sdk/**/*.h"
   subspec.header_dir = "office365_onenote_sdk"
  end

  s.subspec 'Graph' do |subspec|
   subspec.source_files = "sdk-objectivec/office365_graph_sdk/**/*.{h,m}"
   subspec.public_header_files = "sdk-objectivec/office365_graph_sdk/**/*.h"
   subspec.header_dir = "office365_graph_sdk"
  end
end
