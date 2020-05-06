Pod::Spec.new do |s|
    s.name             = 'HorizontalCardsScroller'
    s.version          = '0.1.1'
    s.summary          = 'Collection view with horizontal srolling'
    s.swift_version    = '4.0'

    s.homepage         = 'https://github.com/AlexSmet/HorizontalCardsScroller'
    # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Alex Smetannikov' => 'alexsmetdev@gmail.com' }
    s.source           = { :git => 'https://github.com/AlexSmet/HorizontalCardsScroller.git', :tag => s.version.to_s }
    s.social_media_url = 'https://twitter.com/alexsmetdev'
  
    s.ios.deployment_target = '9.0'
  
    s.source_files = 'HorizontalCardsScroller/Classes/*.swift'
    s.resources = 'HorizontalCardsScroller/Classes/*.xib'
  end
