require 'yaml'

module Vydumschik

  # This module generates human names
  module Name

    # Random first name (gender = :male/:female/nil for random)
    def self.first_name(gender=nil)
      gender ||= random_gender
      gender == :female ? data[:female][rand data[:female].length] : data[:male][rand data[:male].length][:name]
    end

    # Random middle name (gender = :male/:female/nil for random)
    def self.middle_name(gender=nil)
      gender ||= random_gender
      name = data[:male][rand data[:male].length]
      gender == :female ? name[:female_middle] : name[:male_middle]
    end

    # Random surnamename (gender = :male/:female/nil for random)
    def self.surname(gender=nil)
      gender ||= random_gender
      surname = data[:surnames][rand data[:surnames].length]
      surname += 'а' if gender==:female
      surname
    end
    
    # Random full name - surname, first name and middle name (gender = :male/:female/nil for random)
    def self.full_name(gender=nil)
      gender ||= random_gender
      [surname(gender), first_name(gender), middle_name(gender)].join(' ')
    end

    private_class_method :data, :random_gender

    def self.data
      @data ||= YAML.load_file(File.expand_path('../../../data/names.yml', __FILE__))
    end

    def self.random_gender
      rand>0.5 ? :female : :male
    end
  end
end
