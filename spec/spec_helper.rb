require 'coveralls'
Coveralls.wear!

require 'vcr'
require 'pry'
require 'datacite_doi_ify'
require 'webmock/rspec'


VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.default_cassette_options = { :record => :none }
  c.configure_rspec_metadata!
end

RSpec.configure do

end