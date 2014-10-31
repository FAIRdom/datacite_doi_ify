require 'rest-client'

class Datacite
  ENDPOINT = 'https://test.datacite.org/mds'

  def initialize(user_name, password)
    @endpoint = RestClient::Resource.new(ENDPOINT, user_name, password)
  end

  def resolve doi
    response = @endpoint["doi/#{doi}"].get
  end
end
