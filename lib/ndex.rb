require 'ndex/version'
require 'ndex/pokeapi'

require 'rndk/scroll'

module NDEX
  def self.run number
    # if not PokeAPI.can_connect?
    #   puts "Unable to connect to the Pokeapi server"
    #   puts "Check your internet settings and try again"
    #   exit 1
    # end

    puts "Fetching data for Pokemon no #{number}..."
    data = PokeAPI.pokemon number

    @@screen = RNDK::Screen.new
    RNDK::Draw.initRNDKColor
    Ncurses.curs_set 0

    items = data.to_a
    scroll_list = RNDK::SCROLL.new(@@screen,
                                   0,
                                   0,
                                   RNDK::RIGHT,
                                   24,
                                   80,
                                   data["name"],
                                   items,
                                   items.size,
                                   true,
                                   Ncurses::A_REVERSE,
                                   true,
                                   false)
    if scroll_list.nil?
      RNDK::Screen.end_rndk
      exit 1
    end

    scroll_list.activate ''

    RNDK::Screen.end_rndk

  rescue SystemExit
    exit 1

  rescue Exception => e
    RNDK::Screen.end_rndk
    puts e
    puts e.inspect
    puts e.backtrace
    exit 1
  end
end

