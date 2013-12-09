lib = File.expand_path('../lib', __FILE__)
$:.unshift(lib) unless $:.include?(lib)

require 'attr_similar/version'

Gem::Specification.new do |s|
  s.name = 'attr_similar'
  s.version = AttrSimilar::VERSION
  s.date = Date.today rescue '1970-01-01'
  s.summary = 'attr_similar'
  s.description = 'Rails plugin that provides attr_similar helper to declare similarity-matching attributes on a model'
  s.license = 'MIT'
  s.authors = 'Richard Cook'
  s.email = 'rcook@rcook.org'
  s.files = Dir['{app,config,db,lib}/**/*'] + ['LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['test/**/*']
  s.require_paths = ['lib']
  s.homepage = 'https://github.com/rcook/attr_similar/'
  s.add_dependency 'rails', '~> 3.2.14'
end

