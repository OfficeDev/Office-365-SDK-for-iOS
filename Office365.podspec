

Pod::Spec.new do |s|
  s.name         = "Office365"
  s.version      = "0.12.0"
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
  s.ios.deployment_target = "8.0"
  s.source       = { :git => "https://github.com/OfficeDev/Office-365-SDK-for-iOS.git",
		             :tag => "v#{s.version}"
		           }
  s.exclude_files = "**/Build/**/*"
  s.requires_arc = true
  s.dependency "orc"
  
  s.source_files = "sdk/**/*.{h,m}"

  # --- Subspecs ------------------------------------------------------------------#


  s.subspec "DirectoryServices" do |subspec|
    subspec.source_files = "sdk/DirectoryServices/**/*.{h,m}"
    subspec.public_header_files = "sdk/DirectoryServices/**/*.h"
    subspec.header_dir = "DirectoryServices"
  end


  s.subspec "Discovery" do |subspec|
    subspec.source_files = "sdk/Discovery/**/*.{h,m}"
    subspec.public_header_files = "sdk/Discovery/**/*.h"
    subspec.header_dir = "Discovery"
  end


  s.subspec "Files" do |subspec|
    subspec.source_files = "sdk/Files/**/*.{h,m}"
    subspec.public_header_files = "sdk/Files/**/*.h"
    subspec.header_dir = "Files"
  end


  s.subspec "Graph" do |subspec|
    subspec.source_files = "sdk/Graph/**/*.{h,m}"
    subspec.public_header_files = "sdk/Graph/**/*.h"
    subspec.header_dir = "Graph"
  end


  s.subspec "OneNote" do |subspec|
    subspec.source_files = "sdk/OneNote/**/*.{h,m}"
    subspec.public_header_files = "sdk/OneNote/**/*.h"
    subspec.header_dir = "OneNote"
  end


  s.subspec "Outlook" do |subspec|
    subspec.source_files = "sdk/Outlook/**/*.{h,m}"
    subspec.public_header_files = "sdk/Outlook/**/*.h"
    subspec.header_dir = "Outlook"
  end


  s.subspec "SampleService" do |subspec|
    subspec.source_files = "sdk/SampleService/**/*.{h,m}"
    subspec.public_header_files = "sdk/SampleService/**/*.h"
    subspec.header_dir = "SampleService"
  end

end
end
end
end
end
end
end
end
end
end
end
end
