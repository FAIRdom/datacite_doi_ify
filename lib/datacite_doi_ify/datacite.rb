require 'rest-client'

class Datacite
  ENDPOINT = 'https://mds.datacite.org'

  def initialize(user_name, password, endpoint=nil)
    endpoint ||= ENDPOINT
    @endpoint = RestClient::Resource.new(endpoint, user_name, password)
  end

  def resolve doi
    begin
      response = @endpoint["doi/#{doi}"].get
    rescue Exception => e
      #error code
      e.message[0..2]
    end
  end

  def mint doi, url
    begin
      response = @endpoint['doi'].post "doi=#{doi}\nurl=#{url}", content_type: "text/plain;charset=UTF-8"
    rescue Exception => e
      #error code
      e.message[0..2]
    end
  end

  def upload_metadata metadata
    begin
      response = @endpoint['metadata'].post(metadata,content_type: 'application/xml;charset=UTF-8')
    rescue Exception => e
      #error code
      e.message[0..2]
    end
  end

  def metadata doi
    begin
      response = @endpoint["metadata/#{doi}"].get
    rescue Exception => e
      #error code
      e.message[0..2]
    end
  end
end
