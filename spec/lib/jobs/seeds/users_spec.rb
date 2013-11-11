require 'spec_helper'


describe Jobs::Seeds::Users do

  describe '#create_record' do
    let!(:user) { described_class.new.create_record([10000, 'Test User']) }

    subject { user }

    it       { should be_true }
    its(:id) { should == 10000 }
  end
end