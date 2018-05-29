require 'rails_helper'

RSpec.describe Article, type: :model do
  context "Validate Presence" do
    it { should validate_presence_of(:title) }
    it { should have_many(:texts) }
    it { should have_many(:images) }
    it { should validate_numericality_of(:like_number).is_greater_than_or_equal_to(0)}
  end

  context "Self method" do

    it "Show published?" do
      a = build(:article)
      expect(a.published?).to eq false
    end

    it 'Show finish?' do
      a = build(:article)
      expect(a.finish?).to eq false
    end

    it 'Can make finish' do
      a = build(:article)
      a.make_finish
      expect(a.created_at).to_not eq nil
    end

    it 'Increase like number +1 and return number' do
      a = create(:article)
      expect(a.like).to eq 1
    end

    it 'Have order texts images instance' do
      a = create(:article)
      list = Array.new
      list << create(:image, article: a, order: 1)
      list << create(:text, article: a, order: 2)
      list << create(:image, article: a, order: 3)
      expect(a.get_texts_images_instances).to eq list
    end

  end
end
