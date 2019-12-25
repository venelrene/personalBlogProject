require 'rails_helper'

RSpec.describe Post, type: :model do
  it "has a valid factory" do
    expect(build(:post)).to be_valid
  end

  it "is valid with a title and content" do
    post = Post.new(
      title: "Some cool title",
      content:  "another form of content",
      image:      nil,
    )
    expect(post).to be_valid
  end
  it { is_expected.to validate_uniqueness_of :title }
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :content }
end
