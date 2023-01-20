require "spec_helper"
require "rack/test"
require_relative "../artist_repository_spec"
require_relative "../album_repository_spec"
require_relative '../../app'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }


    before(:each) do 
      reset_artists_table
      reset_albums_table
    end

    context 'GET /albums' do
      it 'returns the list of albums with links each albums page' do
          response = get('/albums')
          expect(response.status).to eq (200)
          expect(response.body).to include ('<a href="/albums/1">Doolittle</a>')
          expect(response.body).to include ('<a href="/albums/2">Surfer Rosa</a>')
          expect(response.body).to include ('<a href="/albums/3">Waterloo</a>')
      end
    end

  context 'GET /albums/:id' do
    it 'should return info about album 1' do
     
        response = get('/albums/1')

        expect(response.status).to eq(200)
        expect(response.body).to include ('<h1>Doolittle</h1>')
        expect(response.body).to include ('Release year: 1989')
        expect(response.body).to include ('Artist: Pixies')
    end
  end

  context 'GET /albums/:id' do
    it 'should return info about album 2' do
     
        response = get('/albums/2')

        expect(response.status).to eq(200)
        expect(response.body).to include ('<h1>Surfer Rosa</h1>')
        expect(response.body).to include ('Release year: 1988')
        expect(response.body).to include ('Artist: Pixies')
    end
  end
  
 



  context 'POST /artist' do
    it 'creates a new artist' do
        response = post('/artist', name: 'Wild nothing', genre: 'Indie')

        expect(response.status).to eq (200)
        expect(response.body).to eq ('')

        response = get('/artist')
        expect(response.body).to include('Wild nothing')
    end
  end

  context 'GET /artist' do
    it 'returns a list of artists' do
        response = get('/artist')
        expected_response = 'Pixies, ABBA, Taylor Swift, Nina Simone'
        expect(response.status).to eq (200)
        expect(response.body).to eq(expected_response)
    end
  end

  context 'GET /artists/:id' do
    it 'gets a single artist and displays in HTML page' do
      response = get('/artists/1') 
        expect(response.status).to eq(200)
        expect(response.body).to include ('<h1>Artist: Pixies</h1>')
        expect(response.body).to include ('<h1>Genre: Rock</h1>')
    end
  end

  context 'GET /artists' do
    it 'gets all artists and displays in HTML page as links' do
        response = get('/artists')

        #'Pixies, ABBA, Taylor Swift, Nina Simone'
        expect(response.status).to eq (200)
        expect(response.body).to include ('Pixies')
        expect(response.body).to include ('ABBA')
        expect(response.body).to include ('Taylor Swift')
        expect(response.body).to include ('Nina Simone')
      
    end
  end
end