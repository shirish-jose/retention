require 'spec_helper'

describe User do

  describe '#items' do
    let!(:user) { factory(:user) }

    subject { user.items }

    context 'no purchases yet' do

      it { should == [] }
    end

    context 'has made purchases' do
      let(:item)      { factory(:item) }
      let!(:purchase) { factory(:purchase, item: item, user: user) }

      it { should == [item] }
    end
  end

  describe '#purchases' do
    let!(:user) { factory(:user) }

    subject { user.purchases }

    context 'no purchases yet' do

      it { should == [] }
    end

    context 'items purchased' do
      let(:item)      { factory(:item) }
      let!(:purchase) { factory(:purchase, item: item, user: user) }

      it { should == [purchase] }
    end
  end

  describe '#recommendations' do
    let(:user) { factory(:user) }
    let(:item) { factory(:item) }

    subject { user }

    context 'has recommendations' do
      let(:other_user)                 { factory(:user) }
      let(:other_item)                 { factory(:item) }
      let!(:other_user_recommendation) { factory(:recommendation, user: other_user, item: other_item) }
      let!(:recommendation)            { factory(:recommendation, user: user, item: item) }

      its(:recommendations) { should == [recommendation] }
    end

    context 'has no recommendations' do
      its(:recommendations) { should == [] }
    end
  end

  describe '#recommended_items' do
    let(:user)   { factory(:user) }
    let(:item_A) { factory(:item) }
    let(:item_B) { factory(:item) }

    subject { user }

    context 'has recommendations' do
      let!(:recommendation_A) { factory(:recommendation, user: user, item: item_A, weight: 1) }
      let!(:recommendation_B) { factory(:recommendation, user: user, item: item_B, weight: 2) }

      its(:recommended_items) { should == [item_B, item_A] }
    end

    context 'has no recommendations' do
      its(:recommendations) { should == [] }
    end
  end

  describe '::validations' do

    describe 'presence' do
      let(:user) { factory_build(:user, name: name) }

      subject    { user.valid? }

      context 'name is present' do
        let(:name) { 'Test' }

        it { should be_true }
      end

      context 'name is nil' do
        let(:name) { nil }

        it { should be_false }
      end
    end
  end
end
