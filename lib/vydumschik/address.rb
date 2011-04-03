require 'yaml'

module Vydumschik

  # This module generates random addresses
  module Address

    # Maximum number of apartments in building
    MAX_APT = 100

    # Maximum number of buildings for different types of streets 
    BUILDING_LIMITS = {:street => 50, :alley => 10, :avenue => 120, :square => 10, :other => 20}

    # Probability of building without apartments
    HOUSE_PROBABILITY = 0.2 

    # Probability of building number having a  modifier
    MODIFIER_PROBABILITY = 0.05 

    # Building number modifiers
    BUILDING_MODIFIERS = %w(а б в г д)

    # Returns a random street name
    def self.street
      data[:streets][rand data[:streets].length][:name]
    end

    # Returns a random building number
    def self.building(limit = BUILDING_LIMITS[:other])
      bld = (1+rand(limit)).to_s
      bld+='-'+BUILDING_MODIFIERS[rand BUILDING_MODIFIERS.length] if rand<MODIFIER_PROBABILITY
      bld
    end

    # Returns a random apartment number
    def self.apartment
      (1+rand(MAX_APT)).to_s
    end

    # Returns a random street address
    def self.street_address
      street = data[:streets][rand data[:streets].length]
      bld = building(BUILDING_LIMITS[street[:type]])
      if rand>0.5
        apt = (rand<HOUSE_PROBABILITY) ? bld : bld+'/'+apartment
      else
        apt = (rand<HOUSE_PROBABILITY) ? "д. #{bld}" : "д. #{bld}, кв. #{apartment}"
      end
      "#{street[:name]}, #{apt}"
    end

    private

    def self.data
      @data ||= YAML.load_file(File.expand_path('../../../data/addresses.yml', __FILE__))
    end
  end
end

