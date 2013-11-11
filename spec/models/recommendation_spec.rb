require 'spec_helper'

describe Recommendation do

  describe '#item' do
    let(:item) { factory(:item) }

    subject { factory(:recommendation, item: item) }

    its(:item) { should == item }
  end

  describe '#user' do
    let(:user) { factory(:user) }

    subject { factory(:recommendation, user: user) }

    its(:user) { should == user }
  end

  describe '::validations' do
    let(:item)           { factory(:item) }
    let(:user)           { factory(:user) }
    let(:recommendation) { factory_build(:recommendation, user_id: user_id, item_id: item_id) }

    subject { recommendation.valid? }

    describe 'presence of user' do
      let(:item_id) { item.id }

      context 'user is present' do
        let(:user_id) { user.id }

        it { should be_true }
      end

      context 'user is nil' do
        let(:user_id) { nil }

        it { should be_false }
      end
    end

    describe 'presence of item' do
      let(:user_id) { user.id }

      context 'item is present' do
        let(:item_id) { item.id }

        it { should be_true }
      end

      context 'item is nil' do
        let(:item_id) { nil }

        it { should be_false }
      end
    end
  end
end
