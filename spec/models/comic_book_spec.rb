require 'rails_helper'

describe Comic_book do

  it { should belong_to(:user) }
  it { should have_many(:ratings) }

  describe "#average_score" do
    it "It returns 5 if the comic has 10 ratings of 5 each." do
      comic  = FactoryGirl.create(:comic_book)
      10.times { FactoryGirl.create(:rating, comic_book: comic) }
      expect(comic.average_score).to eq(5)
    end
  end
end
