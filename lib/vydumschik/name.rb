require 'yaml'

module Vydumschik
  module Name
    def self.name(gender=nil)
      gender ||= random_gender
      gender == :female ? data[:female][rand data[:female].length] : data[:male][rand data[:male].length][:name]
    end

    def self.middle_name(gender=nil)
      gender ||= random_gender
      name = data[:male][rand data[:male].length]
      gender == :female ? name[:female_middle] : name[:male_middle]
    end

    def self.surname(gender=nil)
      gender ||= random_gender
      surname = data[:surnames][rand data[:surnames].length]
      surname += 'а' if gender==:female
      surname
    end

    def self.full_name(gender=nil)
      gender ||= random_gender
      [surname(gender), name(gender), middle_name(gender)].join(' ')
    end

    def self.data
      @data ||= YAML.load_file(File.expand_path('../../../data/names.yml', __FILE__))
    end

    def self.random_gender
      rand>0.5 ? :female : :male
    end
  end
end
