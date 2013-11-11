require 'net/http'
require 'json'

module PET

  # Wrapper of the awesome Pokeapi - the Pokemon RESTful API.
  # Homepage: http://pokeapi.co
  class PokeAPI

    ROOT_URI = "http://pokeapi.co"

    # Retrieves and parses a specific data from `uri`.
    #
    # @return A Hash, with it's format described
    #         by the Pokeapi's docs.
    def self.get_data uri
      response = Net::HTTP.get_response URI.parse(uri)

      JSON.parse response.body
    end

    # Retrieves a Pokemon's data by it's `number`.
    def self.pokemon number
      fail "Invalid number '#{number}'" if not (1..718).include? number
      PokeAPI.get_data "#{ROOT_URI}/api/v1/pokemon/#{number}/"
    end
  end
end

