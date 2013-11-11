require 'spec_helper'

describe Item do

  describe '#categories' do
    let!(:item_A) { factory(:item) }

    subject { item_A.categories }

    context 'belongs to categories' do
      let!(:first_category)  { factory(:category) }
      let!(:second_category) { factory(:category) }
      let!(:third_category)  { factory(:category) }
      let!(:item_A)          { factory(:item, categories: [first_category, second_category]) }

      it { should have(2).items }
      it { should include(first_category, second_category) }
    end

    context 'does not belong to any category' do

      it { should == [] }
    end
  end

  describe '::validations' do

    describe 'presence' do
      let(:item) { factory_build(:item, name: name) }

      subject    { item.valid? }

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
