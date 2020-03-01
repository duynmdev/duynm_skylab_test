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
    let(:string_random) {
      (0...10).map { ('a'..'z').to_a[rand(26)] }.join
    }

    context "Count the number of the character in a String after that Sort the character by the number from highest to lowest and lowest to highest:" do
      it "should return hash is sorted" do
        results = question_service.answer_4(string_random)
        expect(results[:lowest_to_highest].map{|v, i| v if i == results[:lowest_to_highest].values.max}.compact).to eq(count_and_sort_max(string_random))
        expect(results[:highest_to_lowest].map{|v, i| v if i == results[:highest_to_lowest].values.min}.compact).to eq(count_and_sort_min(string_random))
      end
    end
  end

  def question_service
    @question_service ||= QuestionService.new
  end

  def find_non_repeated_character string
    string.chars.find { |character| string.count(character) == 1 }
  end

  def count_and_sort_max string
    array_charaters = string.split("")
    array_count_charaters = array_charaters.group_by{|i| i}.map{|k,v| [k, v.count] }
    max_count = array_count_charaters.to_h.values.max
  
    _array = array_count_charaters.map do |first_value, second_value|
      first_value if second_value == max_count
    end

    _array.compact.sort
  end

  def count_and_sort_min string
    array_charaters = string.split("")
    array_count_charaters = array_charaters.group_by{|i| i}.map{|k,v| [k, v.count] }
    max_count = array_count_charaters.to_h.values.min
  
    _array = array_count_charaters.map do |first_value, second_value|
      first_value if second_value == max_count
    end

    _array.compact.sort.reverse
  end
end