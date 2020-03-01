require 'rails_helper'

RSpec.describe QuestionService do

  describe "/question1/answer" do
    let(:array_random) {
      Array.new(10) { rand(1...100) }
    }

    context "Implement bubble sort (highest to lowest and lowest to highest)" do
      it "should be sorted" do
        results = question_service.answer_1(array_random)
        expect(results[:highest_to_lowest]).to eq(array_random.sort.reverse)
        expect(results[:lowest_to_highest]).to eq(array_random.sort)
      end
    end
  end

  describe "/question2/answer" do
    let(:array_random_1) {
      Array.new(7) { rand(1...20) }
    }

    let(:array_random_2) {
      Array.new(5) { rand(1...20) }
    }

    context "Given 2 integer arrays, find the common elements between 2 arrays" do
      it "should return common array" do
        results = question_service.answer_2(array_random_1, array_random_2)
        expect(results).to eq(array_random_1 & array_random_2)
      end
    end
  end

  describe "/question3/answer" do
    let(:string_random) {
      (0...50).map { ('a'..'z').to_a[rand(26)] }.join
    }

    context "Find the first non-repeated character in a String" do
      it "should return first non-repeated character" do
        result = question_service.answer_3(string_random)
        expect(result).to eq(find_non_repeated_character(string_random))
      end
    end
  end

  describe "/question4/answer" do
  end

  def question_service
    @question_service ||= QuestionService.new
  end

  def find_non_repeated_character string
    string.chars.find { |character| string.count(character) == 1 }
  end
end