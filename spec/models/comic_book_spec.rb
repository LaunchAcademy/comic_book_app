require 'rails_helper'

describe ComicBook do

  it { should have_many(:reviews) }

  describe "#average_score" do
    it "It returns 5 if the comic has 10 reviews of 5 each." do
      comic  = FactoryGirl.create(:comic_book)
      10.times { FactoryGirl.create(:review, comic_book: comic) }
      expect(comic.average_score).to eq(5)
    end
  end
end
