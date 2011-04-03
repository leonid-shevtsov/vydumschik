require 'yaml'

module Vydumschik
  module Address
    MAX_APT = 100
    BUILDING_LIMITS = {:street => 50, :alley => 10, :avenue => 120, :square => 10, :other => 20}
    HOUSE_PROBABILITY = 0.2 # probability of address without apartment
    MODIFIER_PROBABILITY = 0.05 # probability of building number with modifier
    BUILDING_MODIFIERS = %w(а б в г д)

    def self.street
      data[:streets][rand data[:streets].length][:name]
    end

    def self.building(limit = BUILDING_LIMITS[:other])
      bld = (1+rand(limit)).to_s
      bld+='-'+BUILDING_MODIFIERS[rand BUILDING_MODIFIERS.length] if rand<MODIFIER_PROBABILITY
      bld
    end

    def self.apartment
      (1+rand(MAX_APT)).to_s
    end

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

    def self.data
      @data ||= YAML.load_file(File.expand_path('../../../data/addresses.yml', __FILE__))
    end
  end
end

