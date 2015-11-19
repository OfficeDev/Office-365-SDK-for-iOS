

Pod::Spec.new do |s|
  s.name         = "Office365"
  s.version      = "0.20.0"
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
  
  s.dependency "MSOutlook-SDK-iOS"
  s.dependency "MSOffice365-Discovery-SDK-iOS"
  s.dependency "MSOneNote-SDK-iOS"
  s.dependency "MSGraph-SDK-iOS"
  s.dependency "MSAADGraph-SDK-iOS"
  
end
  
  
  
