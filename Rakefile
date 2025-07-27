begin
  require 'rspec/core/rake_task'
  desc "Run tests"
  RSpec::Core::RakeTask.new(:test)
rescue LoadError
end

desc "Start the server"
task :start do |t|
  sh "bundle exec rackup config.ru -p 9595"
end