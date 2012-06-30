require 'rake/testtask'
require 'rubygems/package_task'

spec = Gem::Specification.new do |s|
  s.name = 'ramcrest'
  s.version = '0.0.1'
  s.summary = 'Hamcrest matchers for Ruby'
  s.authors = ['Andrew Parker']
  s.email = ['aparker42@gmail.com']
  s.homepage = 'https://github.com/zaphod42/ramcrest'
  s.files = FileList['lib/**/*.rb'].to_a
  s.test_files = FileList['test/**/*'].to_a
  s.description = <<-EOD
Ramcrest is an implementation of Hamcrest for Ruby. This grew out of
my frustration with the lack of flexibility and expressiveness that I
found in the matchers available in RSpec.
EOD
end

Gem::PackageTask.new(spec).define

Rake::TestTask.new do |t|
  t.pattern = 'test/**/*.rb'
end
