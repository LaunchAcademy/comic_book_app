require 'rails_helper'

describe Rating do

  it { should belong_to(:user) }
  it { should belong_to(:comic_book) }
  it { should have_many(:votes) }

  describe "#total_score" do
    it "It returns 5 if their are 5 upvotes and no downvotes." do
      rating = FactoryGirl.create(:rating)
      5.times { FactoryGirl.create(:vote, rating: rating) }
      expect(rating.total_score).to eq(5)
    end
  end
end
