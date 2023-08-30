
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'attributor/version'

Gem::Specification.new do |spec|
  spec.name = 'attributor'
  spec.version = Attributor::VERSION
  spec.authors = ['Josep M. Blanquer', 'Dane Jensen']
  spec.summary = 'A powerful attribute and type management library for Ruby'
  spec.email = ['blanquer@gmail.com', 'dane.jensen@gmail.com']

  spec.homepage = 'https://github.com/rightscale/attributor'
  spec.license = 'MIT'
  spec.required_ruby_version = '>=2.7'

  spec.require_paths = ['lib']
  spec.files         = `git ls-files -z`.split("\x0")
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})

  spec.add_runtime_dependency('hashie', ['~> 3'])
  spec.add_runtime_dependency('faker', [' >= 3.2'])
  spec.add_runtime_dependency('activesupport', ['>= 3'])

  spec.add_development_dependency 'rspec', '~> 3'
  spec.add_development_dependency 'rspec-its'
  spec.add_development_dependency 'rspec-collection_matchers'
  spec.add_development_dependency('yard')
  spec.add_development_dependency('yardstick', ['~> 0'])
  spec.add_development_dependency('bundler', ['>= 0'])
  spec.add_development_dependency('rake-notes', ['~> 0'])
  spec.add_development_dependency('coveralls')
  spec.add_development_dependency('guard', ['~> 2'])
  spec.add_development_dependency('guard-rspec', ['~> 4'])
  spec.add_development_dependency('pry')

  if RUBY_PLATFORM !~ /java/
    spec.add_development_dependency('pry-byebug')
    spec.add_development_dependency('pry-stack_explorer')
  end
  spec.add_development_dependency 'fuubar'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'guard-rubocop'

  spec.add_development_dependency('parslet', ['>= 0'])
end
