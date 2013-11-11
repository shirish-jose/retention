require 'spec_helper'

describe User do

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
