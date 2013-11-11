require 'spec_helper'


describe Jobs::Seeds::Purchases do

  describe '#create_record' do
    let(:user) { factory(:user) }
    let(:item) { factory(:user) }
    let!(:purchase) { described_class.new.create_record([user.id, item.id]) }

    subject { purchase }

    it            { should have(0).errors }
    its(:item_id) { should == item.id }
    its(:user_id) { should == user.id }
  end
end