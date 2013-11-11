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
