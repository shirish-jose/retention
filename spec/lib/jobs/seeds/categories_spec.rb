require 'spec_helper'


describe Jobs::Seeds::Categories do

  describe '#create_record' do
    let!(:category) { described_class.new.create_record([10000, 'Category']) }

    subject { category }

    it       { should be_true }
    its(:id) { should == 10000 }
  end
end