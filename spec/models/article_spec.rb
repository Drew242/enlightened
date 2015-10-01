require 'rails_helper'

RSpec.describe "An Article", type: :model do
  let!(:user) { User.create!(name: "Drew" )}

  let!(:article) { user.articles.create!(title: 'Ruby',
                                         url: 'www.rubyonrails.com',
                                         body: 'great first language')}

  let!(:comment) { article.comments.create!(body: "learning now")}

  it 'belongs to a user' do
    expect(article.users.first.name).to eq("Drew")
  end

  it 'responds to comments' do
    expect(article.comments.first.body).to eq("learning now")
  end

end
