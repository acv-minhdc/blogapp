require 'rails_helper'

RSpec.describe Image, type: :model do
  context 'Validate Presence' do
    it { should validate_presence_of(:order) }
    it { should validate_numericality_of(:like_number).is_greater_than_or_equal_to(0)}
  end

  context 'Custom Validation' do
    it 'check order texts before save' do
      a = create(:article)
      i = create(:text, order: 10, article: a)
      m = build(:image, order: 10, article: a)
      expect{m.save!}.to raise_error(ActiveRecord::RecordNotSaved)
      expect(m.errors.messages[:order]).to include('has existed')
    end
  end
end
