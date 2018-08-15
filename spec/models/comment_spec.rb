require 'rails_helper'

RSpec.describe Comment, type: :model do

  context 'comment associates test' do
    it { should belong_to(:article) }
    it { should belong_to(:user) }
  end

  context 'comment validates test' do
    it { should validate_presence_of(:body) }
  end

  context 'comment callbacks test' do
    it { is_expected.to callback(:set_commenter_name).before(:create) }
  end

  context 'comment methods test' do
    let(:user) do
      User.create(
        email: 'tst@tst.com',
        user_name: 'test',
        password: 'test_12345',
        password_confirmation: 'test_12345'
      )
    end
    let(:article) do
      user.articles.create(title: 'test_title', text: 'test_text')
    end
    let(:comment) do
      user.comments.create(body: 'test', article_id: article.id)
    end

    it 'set_commenter_id' do
      expect(comment.set_commenter_id(user)).to eq(user.id)
    end
  end

end