require 'spec_helper'


describe Jobs::Seeds::Base do

  describe '#create_record' do
    subject { described_class.new }

    it 'raises an Not Implemented Error' do
      expect { subject.create_record([]) }.to raise_error(NotImplementedError)
    end
  end
end