require 'bundler/gem_tasks'

require 'rubocop/rake_task'

require 'rake/testtask'

desc 'Run Ruby style checks'
RuboCop::RakeTask.new(:ruby)

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