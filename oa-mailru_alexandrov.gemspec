# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{oa-mailru_alexandrov}
  s.version = "0.0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Alexander Gorkunov", "Igor Alexandrov"]
  s.date = %q{2011-02-07}
  s.description = %q{OmniAuth extension for mail.ru authentication}
  s.email = %q{igor.alexandrov@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
    "README.rdoc"
  ]
  s.files = [
    "LICENSE",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "lib/oa-mailru.rb",
    "lib/omniauth/mailru.rb",
    "lib/omniauth/strategies/mailru_api.rb",
    "lib/omniauth/strategies/mailru_api/view_helper.rb",
    "pkg/oa-mailru_alexandrov-0.0.4.gem",
    "spec/oa-mailru_spec.rb",
    "spec/spec.opts",
    "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/igor-alexandrov/oa-mailru}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.5.0}
  s.summary = %q{OmniAuth extension for mail.ru authentication}
  s.test_files = [
    "spec/oa-mailru_spec.rb",
    "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<oa-core>, ["~> 0.1.4"])
      s.add_development_dependency(%q<rspec>, [">= 1.2.9"])
      s.add_development_dependency(%q<yard>, [">= 0"])
    else
      s.add_dependency(%q<oa-core>, ["~> 0.1.4"])
      s.add_dependency(%q<rspec>, [">= 1.2.9"])
      s.add_dependency(%q<yard>, [">= 0"])
    end
  else
    s.add_dependency(%q<oa-core>, ["~> 0.1.4"])
    s.add_dependency(%q<rspec>, [">= 1.2.9"])
    s.add_dependency(%q<yard>, [">= 0"])
  end
end

