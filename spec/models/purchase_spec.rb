require 'spec_helper'

describe Purchase do


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
