Gem::Specification.new do |s|
  s.name               = "flatiron-template"
  s.version            = "0.0.1"

  s.authors = ["Fabio Kenji", "Tom Coheeno"]
  s.date = %q{2014-11-02}
  s.description = %q{ An experimental markup language }

  s.files = 
  %w[
    lib/flatiron-template.rb
    lib/flatiron-template/template.rb
    lib/flatiron-template/tilt.rb
    lib/flatiron-template/register_tilt.rb
  ]
  s.test_files = 
  %w[
    spec/spec_helper.rb
    spec/lib/flatiron-template/template_spec.rb
  ]

  s.homepage = %q{http://flatironschool.com}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{2.2.2}
  s.summary = %q{ This is a PoC of a markup language implemented using ruby and method_missing }
end