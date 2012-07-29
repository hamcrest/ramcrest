Gem::Specification.new do |s|
  s.name = 'ramcrest'
  s.version = '0.0.1'
  s.summary = 'Hamcrest matchers for Ruby'
  s.authors = ['Andrew Parker']
  s.email = ['aparker42@gmail.com']
  s.homepage = 'https://github.com/zaphod42/ramcrest'
  s.files = Dir.glob('lib/**/*.rb')
  s.test_files = Dir.glob('test/**/*')
  s.description = <<-EOD
Ramcrest is an implementation of Hamcrest for Ruby. This grew out of
my frustration with the lack of flexibility and expressiveness that I
found in the matchers available in RSpec.
EOD
end

