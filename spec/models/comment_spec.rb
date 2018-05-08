require 'rails_helper'

RSpec.describe Comment, type: :model do


  let(:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "helloworld") }
  let(:post) { topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: user) }
  let(:comment) {Comment.create!(body: 'Comment Body', post: post) }

  describe "attributes" do
    it " has a body attributes" do
      expect(comment).to have_attributes(body: "Comment Body")
    end
  end
end
