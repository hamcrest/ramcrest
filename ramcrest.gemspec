Gem::Specification.new do |s|
  s.name = 'ramcrest'
  s.version = '0.1.0'
  s.summary = 'Powerful, composable matchers for Ruby'
  s.authors = ['Andrew Parker']
  s.email = ['aparker42@gmail.com']
  s.homepage = 'https://github.com/hamcrest/ramcrest'
  s.files = Dir.glob('lib/**/*.rb')
  s.test_files = Dir.glob('test/**/*')
  s.description = <<-EOD
Ramcrest is an implementation of Hamcrest for Ruby. It integrates with
MinitTest and RSpec. Writing new matchers is easy! Why not give it a try?
EOD
end

