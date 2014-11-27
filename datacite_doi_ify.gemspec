# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "datacite_doi_ify/version"

Gem::Specification.new do |s|
  s.name        = "datacite_doi_ify"
  s.version     = DataciteDoiIfy::VERSION
  s.authors     = ["quyen nguyen"]
  s.email       = ["thucquyendn@gmail.com"]
  s.homepage    = ""
  s.summary     = "A ruby gem to working with datacite doi restful web service"
  s.description = "Mint DOI and resolve DOI using Datacite restful web service"

  s.rubyforge_project = "datacite_doi_ify"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  s.add_runtime_dependency "rest-client", "~> 1.7"
  
  s.add_development_dependency "rspec"
  s.add_development_dependency "rspec-nc"
  s.add_development_dependency "guard"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "pry"
  s.add_development_dependency "pry-remote"
  s.add_development_dependency "pry-nav"
  s.add_development_dependency "coveralls"
  s.add_development_dependency "webmock"
  s.add_development_dependency "vcr"
end
