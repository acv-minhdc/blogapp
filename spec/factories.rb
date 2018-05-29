FactoryBot.define do
  factory :text do
    sentences 'Hello World'
    order 1
    article
  end

  factory :image do
    order 2
    article
  end

  factory :article do
    title 'Ruby'
    factory :article_with_texts_images do
      after(:create) do |article, evaluator|
        create(:text, article: article)
        create(:image, article: article)
      end
    end
  end
end
