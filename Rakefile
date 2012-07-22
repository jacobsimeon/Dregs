require 'rubygems'
require 'xcodebuild'
  
def project_file
  Dir['./*.xcodeproj'][0]
end

task :build do
  `xcodebuild -project #{project_file} -target Bolst -configuration Debug -sdk iphonesimulator5.0`
end

task :server do
  `ruby DregsTests/DregsServer/server.rb`
end
