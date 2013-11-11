require 'spec_helper'


describe Jobs::Seeds::Items do

  describe '#create_record' do
    let!(:item) { described_class.new.create_record([10000, 'Test Item']) }

    subject { item }

    it       { should be_true }
    its(:id) { should == 10000 }
  end
end