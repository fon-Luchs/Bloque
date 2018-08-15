require 'rails_helper'

RSpec.describe Article, type: :model do

  let(:user) do
    User.create(
      email: 'tst@tst.com',
      user_name: 'test',
      password: 'test_12345',
      password_confirmation: 'test_12345'
    )
  end
  let(:article) { user.articles.new(title: 'Test title', text: 'Test text') }


  context 'article validation test' do

    it { should validate_presence_of(:text) }
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_least(5) }

    it 'should validates_associated :comments' do
      article.comments.new(body: '')
      expect(article.save).to eq(false)
    end
  end

  context 'article callbacks test' do
    it { is_expected.to callback(:get_username).after(:save) }
  end

  context 'article matches test' do
    it { should have_many(:comments).dependent(:destroy).inverse_of(:article) }
    it { should belong_to(:user) }
    it { should have_many(:filters) }
    it { should have_many(:categories).dependent(:destroy).through(:filters) }
  end

  context 'article_categories test' do
    let(:first_category)  { article.categories.new(category: 'world') }

    it 'article all_categories' do
      article.categories.new(category: 'world')
      article.categories.new(category: 'News')
      expect(article.all_categories).to eq('world, News')
    end

    it 'article all_categories=' do
      expect(article.all_categories = 'world').to eq(first_category.category)
    end
  end

  context 'article model test' do
    it { is_expected.to callback(:get_username).after(:save) }
  end

end