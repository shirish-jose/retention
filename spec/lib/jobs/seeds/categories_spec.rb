require 'spec_helper'


describe Jobs::Seeds::Categories do

  describe '#create_record' do
    subject { described_class.new.create_record([10000, 'Category']) }

    it { should be_true }
  end
end