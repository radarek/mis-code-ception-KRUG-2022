# -*- encoding: utf-8 -*-
# stub: benchmark-bigo 1.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "benchmark-bigo".freeze
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Davy Stevenson".freeze]
  s.date = "2014-11-04"
  s.description = "Benchmark objects to help calculate Big O behavior".freeze
  s.email = ["davy.stevenson@gmail.com".freeze]
  s.extra_rdoc_files = ["README.md".freeze]
  s.files = ["README.md".freeze]
  s.homepage = "http://github.com/davy/benchmark-bigo".freeze
  s.licenses = ["MIT".freeze]
  s.rdoc_options = ["--main".freeze, "README.md".freeze]
  s.rubygems_version = "3.3.7".freeze
  s.summary = "Benchmark objects to help calculate Big O behavior".freeze

  s.installed_by_version = "3.3.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<benchmark-ips>.freeze, ["~> 2.0"])
    s.add_runtime_dependency(%q<chartkick>.freeze, ["~> 1.2"])
    s.add_development_dependency(%q<minitest>.freeze, ["~> 5.3"])
    s.add_development_dependency(%q<rdoc>.freeze, ["~> 4.0"])
    s.add_development_dependency(%q<rake>.freeze, [">= 0"])
  else
    s.add_dependency(%q<benchmark-ips>.freeze, ["~> 2.0"])
    s.add_dependency(%q<chartkick>.freeze, ["~> 1.2"])
    s.add_dependency(%q<minitest>.freeze, ["~> 5.3"])
    s.add_dependency(%q<rdoc>.freeze, ["~> 4.0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
  end
end
