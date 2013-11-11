require 'open-uri'
require 'net/http'
require 'json'
require 'ndex/version'

module NDEX

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

    # Tells if the user can connect to the Pokeapi server.
    #
    # If not, that's probably an internetconnection
    # fault or something.
    def self.can_connect?
      begin
        true if open ROOT_URI
      rescue
        false
      end
    end

  end
end

