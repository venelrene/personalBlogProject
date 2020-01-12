require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'has a valid factory' do
    expect(build(:comment)).to be_valid
  end

  it 'is valid with a name and comment' do
    post = create :post
    comment = post.comments.create(
      name: 'Some cool name',
      comment: 'another form of content',
    )
    expect(comment).to be_valid
  end

  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :comment }
  it { is_expected.to validate_length_of(:name).is_at_least(4) }
  it { is_expected.to validate_length_of(:comment).is_at_least(4) }
end
