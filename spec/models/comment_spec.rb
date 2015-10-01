require 'rails_helper'

RSpec.describe "A Comment", type: :model do
  let!(:user) { User.create!(name: "Drew" )}

  let!(:article) { user.articles.create!(title: 'Ruby',
                                         url: 'www.rubyonrails.com',
                                         body: 'great first language')}

  let!(:comment) { user.articles.first.comments.create!(body: "learning now")}

  it "belong to an article" do
    expect(comment.article.title).to eq("Ruby")
  end

  it "has a user id" do
    expect(comment.article.users.first.id.class).to eq(Fixnum)
  end
end
