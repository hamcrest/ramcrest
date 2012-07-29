require 'rake/testtask'
require 'rake/clean'

Rake::TestTask.new do |t|
  t.pattern = 'test/**/*.rb'
end

Rake::TestTask.new(:spec) do |t|
  t.pattern = 'spec/**/*.rb'
end

task :default => [:test, :spec]

CLOBBER.include('ramcrest*.gem')
task :package do
  `gem build ramcrest.gemspec`
end
