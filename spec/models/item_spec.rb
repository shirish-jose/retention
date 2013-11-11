require 'spec_helper'

describe Item do

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
