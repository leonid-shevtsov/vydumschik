require 'spec_helper'

describe Vydumschik::Address do
  subject { described_class }

  it "should construct streets" do
    subject.street.should be_a String
  end

  it "should construct buildings" do
    subject.building.should be_a String
  end

  it "should construct apartment numbers" do
     subject.apartment.should be_a String
  end

  it "should construct street addresses" do
    subject.street_address.should be_a String
  end
end