require 'rails_helper'

RSpec.describe "A User", type: :model do
  let!(:user) { User.create!(name: "Drew" )}

  let!(:article) { user.articles.create!(title: 'Ruby',
                                         url: 'www.rubyonrails.com',
                                         body: 'great first language')}

  let!(:comment) { user.articles.first.comments.create!(body: "learning now")}

  it "has articles" do
    expect(user.articles.first.title).to eq("Ruby")
  end

  it "has comments" do
    expect(user.articles.first.comments.first.body).to eq("learning now")
  end
end
