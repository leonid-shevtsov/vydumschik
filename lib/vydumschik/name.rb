# encoding: utf-8

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

    private

    def self.data
      unless @data
        @data = YAML.load_file(File.expand_path('../../../data/names.yml', __FILE__))
        encode_data_to_utf8 if RUBY_VERSION >= '1.9'
      end
      @data
    end

    def self.random_gender
      rand>0.5 ? :female : :male
    end

    def self.encode_data_to_utf8
      @data[:male].each do |s|
        s[:male_middle].force_encoding('utf-8')
        s[:female_middle].force_encoding('utf-8')
        s[:name].force_encoding('utf-8')
      end
      @data[:female].each {|s| s.force_encoding('utf-8') }
      @data[:surnames].each {|s| s.force_encoding('utf-8') }
    end
  end
end
