require 'spec_helper'

describe DataciteDoiIfy do

  describe 'resolve a DOI' do
    it 'returns a url associated with a given DOI' do
      pending
    end
  end

  describe 'mint a DOI' do
    context 'DOI does not exist' do
      it 'mint a new DOI' do
        pending
      end
    end

    context 'DOI exists' do
      it 'updates the URL' do
        pending
      end
    end
  end

  describe 'retrieve metadata for a DOI' do
    it 'returns metadata associated with a given DOI' do
      pending
    end
  end

  describe 'update metadata for a DOI' do
    it 'creates new version of metadata' do
      pending
    end
  end

  describe 'inactivate a DOI' do
    it 'marks a dataset as inactive' do
      pending
    end
  end

  describe 'activate a DOI' do
    context 'after a DOI being inactivated'
      it 'post new metadata for a given DOI' do
        pending
      end
  end

end