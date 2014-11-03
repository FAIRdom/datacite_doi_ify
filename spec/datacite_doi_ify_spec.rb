require 'spec_helper'

describe DataciteDoiIfy do

  let(:endpoint)    { Datacite.new('username', 'password') }
  let(:doi)    { '10.5072/MY_TEST' }
  let(:url)    { 'https://seek.sysmo-db.org' }

  describe 'resolve a DOI' do
    it 'returns a url associated with a given DOI' do
      expect(endpoint.resolve(doi)).to eq(url)
    end

    it 'returns a 401 for un-authorized account' do
      invalid_user = 'test'
      invalid_password = 'test'
      endpoint = Datacite.new(invalid_user, invalid_password)
      expect(endpoint.resolve(doi)).to eq('401')
    end

    it 'returns a 404 for not-found DOI' do
      doi = 'non-existing'
      expect(endpoint.resolve(doi)).to eq('404')
    end
  end

  describe 'mint a DOI' do
    context 'DOI does not exist' do
      it 'mint a new DOI' do
        metadata = open('my_test.xml').read
        expect(endpoint.upload_metadata(metadata)).to eq('OK (10.5072/my_test)')
        expect(endpoint.mint(doi, url)).to eq('OK')
        expect(endpoint.resolve(doi)).to eq(url)
      end

      it 'returns 412 Precondition failed if metadata has not been uploaded ' do
        new_doi = "10.5072/new_doi"
        expect(endpoint.mint(new_doi, url)).to eq('412')
      end
    end

    context 'DOI exists' do
      it 'updates the URL if different' do
        #use test_doi.xml so that it does not update the url of my_test.xml
        metadata = open('test_doi.xml').read
        doi = '10.5072/test_doi'
        expect(endpoint.upload_metadata(metadata)).to eq('OK (10.5072/test_doi)')
        expect(endpoint.mint(doi, url)).to eq('OK')
        expect(endpoint.resolve(doi)).to eq(url)

        new_url = 'https://seek.sysmo-db.org/data_files'
        expect(endpoint.mint(doi, new_url)).to eq('OK')
        expect(endpoint.resolve(doi)).to eq(new_url)
      end
    end
  end

  describe 'retrieve metadata for a DOI' do
    it 'returns metadata associated with a given DOI' do
      metadata = open('my_test.xml').read
      expect(endpoint.metadata(doi)).to eq(metadata)
    end

    it 'returns 404 Not Found for non-existing DOI' do
      doi = 'non-existing'
      expect(endpoint.metadata(doi)).to eq('404')
    end
  end

  describe 'upload metadata for a DOI' do
    it 'creates new version of metadata' do
      metadata = open('my_test.xml').read
      expect(endpoint.upload_metadata(metadata)).to eq('OK (10.5072/my_test)')
    end

    it 'returns 400 (Bad request) for an invalid xml' do
      # without DOI
      metadata = open('invalid_doi.xml').read
      expect(endpoint.upload_metadata(metadata)).to eq('400')
    end
  end

  describe 'inactivate a DOI' do
    it 'marks a dataset as inactive'
  end

  describe 'activate a DOI' do
    context 'after a DOI being inactivated' do
      it 'post new metadata for a given DOI'
    end
  end

  #TODO: Media API
end