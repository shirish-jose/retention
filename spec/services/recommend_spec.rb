require 'spec_helper'

describe Services::Recommend do
  let!(:user) { factory(:user) }

  let!(:category_1) { factory(:category) }
  let!(:category_2) { factory(:category) }
  let!(:category_3) { factory(:category) }
  let!(:category_4) { factory(:category) }

  let!(:item_1) { factory(:item, categories: [category_1, category_2, category_3])}
  let!(:item_2) { factory(:item, categories: [category_2, category_3, category_4])}
  let!(:item_3) { factory(:item, categories: [category_3, category_4])}
  let!(:item_4) { factory(:item, categories: [category_4])}

  let!(:make_purchase) { factory(:purchase, user: user, item: item_1) }

  subject { described_class.new(user.id) }

  describe '#category_ids' do

    its(:category_ids) { should have(3).items }
    its(:category_ids) { should include(category_1.id, category_2.id, category_3.id) }
  end

  describe '#perform!' do
    let!(:add_recommendations) { subject.perform! }
    let(:result)               { user.recommended_items }

    it 'works' do
      result.should include(item_2, item_3)
    end

    it 'orders items as per weight' do
      result.first.should == item_2
    end
  end

  describe '#purchased_item_ids' do

    its(:purchased_item_ids) { should == [item_1.id] }
  end

  describe '#recommended_items' do

    its(:recommended_items) { should include(item_2, item_3) }
    its(:recommended_items) { should_not include(item_1, item_4) }
  end
end