Pod::Spec.new do |s|

  # 1
  s.platform = :ios
  s.ios.deployment_target = '8.0'
  s.name = "Cards"
  s.summary = "Cards logic library."
  s.requires_arc = true

  # 2
  s.version = "0.0.1"

  # 3
  s.license = { :type => "MIT", :file => "LICENSE" }

  # 4 - Replace with your name and e-mail address
  s.author = { "Patrick Laplante" => "laplante.patrick@gmail.com" }


  # 5 - Replace this URL with your own Github page's URL (from the address bar)
  s.homepage = "https://github.com/patbonecrusher/Cards"

  # 6 - Replace this URL with your own Git URL from "Quick Setup"
  s.source       = { :git => "git@github.com:patbonecrusher/Cards.git", :tag => "0.0.1" }
  s.exclude_files = "Classes/Exclude"

  # 7
  s.framework = "UIKit"

  # 8
  s.source_files = "Cards/**/*.{swift}"

  # 9
  #s.resources = "Cards/**/*.{png,jpeg,jpg,storyboard,xib}"
end
