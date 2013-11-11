require 'spec_helper'


describe Jobs::Seeds::Items do

  describe '#create_record' do
    subject { described_class.new.create_record([10000, 'Test Item']) }

    it { should be_true }
  end
end