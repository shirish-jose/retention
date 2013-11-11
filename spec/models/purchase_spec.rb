require 'spec_helper'

describe Purchase do

  describe '#update_user_recommendations' do
    let!(:user)          { factory(:user) }
    let!(:category_1)    { factory(:category) }
    let!(:item_1)        { factory(:item, categories: [category_1])}
    let!(:item_2)        { factory(:item, categories: [category_1])}
    let!(:make_purchase) { factory(:purchase, item: item_1, user: user) }

    subject { user }

    its(:recommended_items) { should == [item_2] }
  end

  describe '::validations' do
    let(:item)     { factory(:item) }
    let(:user)     { factory(:user) }
    let(:purchase) { factory_build(:purchase, item_id: item_id, user_id: user_id) }

    subject { purchase.valid? }

    describe 'presence of item' do
      let(:user_id) { user.id }

      context 'item is present' do
        let(:item_id) { item.id }

        it { should be_true }
      end

      context 'item is absent' do
        let(:item_id) { nil }

        it { should be_false }
      end
    end

    describe 'presence of item' do
      let(:item_id) { item.id }

      context 'user is present' do
        let(:user_id) { user.id }

        it { should be_true }
      end

      context 'user is absent' do
        let(:user_id) { nil }

        it { should be_false }
      end
    end
  end
end
