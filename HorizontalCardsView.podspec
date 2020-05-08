Pod::Spec.new do |s|
    s.name             = 'HorizontalCardsView'
    s.version          = '0.1.2'
    s.summary          = 'Collection view with horizontal srolling'
    s.swift_version    = '4.0'

    s.homepage         = 'https://github.com/AlexSmet/HorizontalCardsView'
    # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Alex Smetannikov' => 'alexsmetdev@gmail.com' }
    s.source           = { :git => 'https://github.com/AlexSmet/HorizontalCardsView.git', :tag => s.version.to_s }
    s.social_media_url = 'https://twitter.com/alexsmetdev'
  
    s.ios.deployment_target = '9.0'
  
    s.source_files = 'HorizontalCardsView/Classes/*.swift'
    s.resources = 'HorizontalCardsView/Classes/*.xib'
  end
