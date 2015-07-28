Pod::Spec.new do |s|
  s.name         = "Office365"
  s.version      = "0.11.0"
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
  s.dependency "orc"

  # --- Subspecs ------------------------------------------------------------------#

  s.subspec 'outlook' do |subspec|
     subspec.source_files = "sdk/outlook_services/**/*.{h,m}"
     subspec.public_header_files = "sdk/outlook_services/**/*.h"
     subspec.header_dir = "outlook_services"
  end

  s.subspec 'files' do |subspec|
     subspec.source_files = "sdk/files_services/**/*.{h,m}"
     subspec.public_header_files = "sdk/files_services/**/*.h"
     subspec.header_dir = "files_services"
  end

  s.subspec 'directory' do |subspec|
     subspec.source_files = "sdk/directory_services/**/*.{h,m}"
     subspec.public_header_files = "sdk-objectivc/directory_services/**/*.{h,m}"
     subspec.header_dir = "directory_services"
  end

  s.subspec 'discovery' do |subspec|
     subspec.source_files = "sdk/discovery_services/**/*.{h,m}"
     subspec.public_header_files = "sdk/discovery_services/**/*.h"
     subspec.header_dir = "discovery_services"
  end

  s.subspec 'lists' do |subspec|
     subspec.source_files = "sdk/list_services/**/*.{h,m}"
     subspec.public_header_files = "sdk/list_services/**/*.h"
     subspec.header_dir = "list_services"
  end

  s.subspec 'onenote' do |subspec|
   subspec.source_files = "sdk/onenote_services/**/*.{h,m}"
   subspec.public_header_files = "sdk/onenote_services/**/*.h"
   subspec.header_dir = "onenote_services"
  end

  s.subspec 'unified' do |subspec|
   subspec.source_files = "sdk/unified_services/**/*.{h,m}"
   subspec.public_header_files = "sdk/unified_services/**/*.h"
   subspec.header_dir = "unified_services"
  end
end
