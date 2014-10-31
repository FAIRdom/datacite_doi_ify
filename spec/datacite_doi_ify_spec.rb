require 'spec_helper'

describe DataciteDoiIfy do

  describe 'resolve a DOI' do
    it 'returns a url associated with a given DOI'
  end

  describe 'mint a DOI' do
    context 'DOI does not exist' do
      it 'mint a new DOI'
    end

    context 'DOI exists' do
      it 'updates the URL'
    end
  end

  describe 'retrieve metadata for a DOI' do
    it 'returns metadata associated with a given DOI'
  end

  describe 'update metadata for a DOI' do
    it 'creates new version of metadata'
  end

  describe 'inactivate a DOI' do
    it 'marks a dataset as inactive'
  end

  describe 'activate a DOI' do
    context 'after a DOI being inactivated'
      it 'post new metadata for a given DOI'
  end

  #TODO: Media API
end