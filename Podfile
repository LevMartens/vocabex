post_install do |pi|
    pi.pods_project.targets.each do |t|
      t.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '10.0'
      end
    end
end
platform :ios, '10.0'

target 'Vocabear' do
  
  use_frameworks!
  pod 'MaterialComponents', '~> 120.0'

  target 'VocabearTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'VocabearUITests' do
    # Pods for testing
  end

end
