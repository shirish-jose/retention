require 'spec_helper'

describe Category do

  describe '#items' do
    let!(:first_category)  { factory(:category) }

    subject { first_category.items }

    context 'category has items' do
      let!(:second_category) { factory(:category) }
      let!(:item_A)          { factory(:item, categories: [first_category]) }
      let!(:item_B)          { factory(:item, categories: [first_category, second_category]) }
      let!(:item_C)          { factory(:item, categories: [second_category]) }

      it { should have(2).items }
      it { should include(item_A, item_B) }
    end

    context 'category has no items' do

      it { should == [] }
    end
  end

  describe '::validations' do

    describe 'presence' do
      let(:category) { factory_build(:category, name: name) }

      subject    { category.valid? }

      context 'name is present' do
        let(:name) { 'Test Category' }

        it { should be_true }
      end

      context 'name is nil' do
        let(:name) { nil }

        it { should be_false }
      end
    end
  end
end
