require 'spec_helper'

describe Vydumschik::Name do
  subject { described_class }

  it "should generate first names" do
    subject.first_name.should be_a String
  end

  it "should generate middle names" do
    subject.middle_name.should be_a String
  end

  it "should generate surnames" do
    subject.surname.should be_a String
  end

  it "should generate full names" do
    subject.full_name.should be_a String
  end
end