require 'spec_helper'


describe Jobs::Seeds::AddItemCategories do
  let(:item)     { factory(:item) }
  let(:category) { factory(:category) }

  subject { item }

  describe '#create_record' do
    let!(:perform) { described_class.new.create_record([item.id, category.id]) }

    its(:categories) { should include(category) }
  end
end