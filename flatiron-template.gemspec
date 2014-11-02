Gem::Specification.new do |s|
  s.name               = "flatiron-template"
  s.version            = "0.0.1"

  s.authors = ["Fabio Kenji", "Tom Coheeno"]
  s.date = %q{2014-11-02}
  s.description = %q{ An experimental markup language }

  s.files = ["Rakefile", "lib/hola.rb", "lib/hola/translator.rb", "bin/hola"]
  s.test_files = ["test/test_hola.rb"]

  s.homepage = %q{http://flatironschool.com}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{2.2.2}
  s.summary = %q{ This is a PoC of a markup language implemented using ruby and method_missing }
end