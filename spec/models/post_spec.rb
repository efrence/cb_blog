require 'rails_helper'

RSpec.describe Post, type: :model do
  subject {
    user = create(:user)
    described_class.new(title: 'a title', content: 'content', user_id: user.id) 
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a title" do
    subject.title = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a content" do
    subject.content = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a author" do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end

	describe "Associations" do
		it { should belong_to(:author) }
	end
end
