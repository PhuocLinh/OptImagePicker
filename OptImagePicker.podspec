Pod::Spec.new do |s|

  s.name         = "OptImagePicker"
  s.version      = "0.3.1"
  s.summary      = "Optimize UIImagePickerController with multiple selection support."
  s.homepage     = "https://github.com/PhuocLinh/OptImagePicker"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.authors      = { "Linh Luu" => "luuphuoclinh@gmail.com" }

  s.platform         = :ios, "8.0"

  s.source       = { :git => "https://github.com/PhuocLinh/OptImagePicker.git", :tag => s.version }  
  s.source_files  = ["OptImagePicker/*.{h,m}"]
  s.exclude_files    = "OptImagePicker/OptImagePicker.h"
  s.resource_bundles = { "OptImagePicker" => "OptImagePicker/*.{lproj,storyboard}" }
  s.requires_arc = true
  s.framework = "Photos"

end
