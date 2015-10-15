require 'bundler'
require 'bundler/gem_tasks'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

require 'rubocop/rake_task'
desc 'Run Ruby style checks'
RuboCop::RakeTask.new(:rubocop)


require 'rake/testtask'
desc 'Tests local'
Rake::TestTask.new(:test) do |test|
  test.libs << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

task default: :test

#desc 'Run tests on Travis'
#task travis: %w(style spec) # TODO: Figure out how to run integration tests in CI.
#heroku.rake