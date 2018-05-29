require 'rails_helper'

RSpec.describe Text, type: :model do
  context 'Validate Presence' do
    it { should validate_presence_of(:order) }
    it { should validate_numericality_of(:like_number).is_greater_than_or_equal_to(0)}
  end

  context 'Custom Validation' do
    it 'check order texts before save' do
      a = create(:article)
      m = create(:image, order: 10, article: a)
      i = build(:text, order: 10, article: a)
      expect{i.save!}.to raise_error(ActiveRecord::RecordNotSaved)
      expect(i.errors.messages[:order]).to include('has existed')
    end
  end

end
