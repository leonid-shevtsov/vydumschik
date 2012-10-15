require 'spec_helper'

describe Vydumschik::Lorem do
  subject { described_class }

  it "should generate words" do
    subject.word.should be_a String
  end

  it "should generate sentences" do
    subject.sentence.should be_a String
  end

  it "should generate paragraphs" do
    subject.paragraph.should be_a String
  end
end