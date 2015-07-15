# -*- encoding: utf-8 -*-
$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'datacite_doi_ify/version'

Gem::Specification.new do |s|
  s.name        = 'datacite_doi_ify'
  s.version     = DataciteDoiIfy::VERSION
  s.authors     = ['Quyen Nguyen', 'Finn Bacall']
  s.email       = ['thucquyendn@gmail.com', 'finn.bacall@manchester.ac.uk']
  s.homepage    = 'https://github.com/FAIRdom/datacite_doi_ify'
  s.summary     = 'A ruby gem for working with the DataCite doi restful ' \
                  'web service'
  s.description = 'Mint a DOI and resolve a DOI using the Datacite restful ' \
                  'web service'
  s.license     = 'BSD'

  s.rubyforge_project = 'datacite_doi_ify'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map do |f|
    File.basename(f)
  end
  s.require_paths = ['lib']

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  s.add_runtime_dependency 'rest-client', '~> 1.7'

  s.add_development_dependency 'rspec', '~> 3.1'
  s.add_development_dependency 'rspec-nc', '~> 0.2'
  s.add_development_dependency 'guard', '~> 2.8'
  s.add_development_dependency 'guard-rspec', '~> 4.3'
  s.add_development_dependency 'pry', '~> 0.10'
  s.add_development_dependency 'pry-remote', '~> 0.1'
  s.add_development_dependency 'pry-nav', '~> 0.2'
  s.add_development_dependency 'coveralls', '~> 0.7'
  s.add_development_dependency 'webmock', '~> 1.20'
  s.add_development_dependency 'vcr', '~> 2.9'
end
