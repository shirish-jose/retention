require 'spec_helper'

describe Category do

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
