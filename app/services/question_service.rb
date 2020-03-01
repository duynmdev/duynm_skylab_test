class QuestionService
  # Implement Bubble Sort
  def answer_1 array=[]
    array = [9,1,8,2,7,3,6,4,5,10,13] unless array.present?

    {
      highest_to_lowest: sort_highest_to_lowest(array.dup),
      lowest_to_highest: sort_lowest_to_highest(array.dup)
    }
  end

  def answer_2 arr1=[], arr2=[]
    arr1 = [3, 4, 6, 3, 7, 8, 5, 9] unless arr1.present?
    arr2 = [5, 4, 1, 2, 3] unless arr2.present?
    common_array = []
    index = 0
    while index < arr1.length
      _index = 0
      while _index < arr2.length
        common_array << arr1[index] if (arr1[index] == arr2[_index]) && !is_in_array?(arr1[index], common_array)
        _index += 1 
      end
      index += 1
    end
    common_array
  end

  def answer_3 str=""
    str = "abcdabcdabcdabcdeabcdcba" unless str.present?
    str = convert_string_to_arr(str)
    str_length = str.length 
    for i in 0..str_length-1
      j = 0
      while j < str_length-1
        break if j != i && str[i] == str[j]
        j += 1
      end 
      return str[i] if (j == str_length-1)
    end
    ""
  end

  def answer_4 str=""
    str = "zyabcdabcac" unless str.present?
    arr1 = sort_highest_to_lowest(convert_string_to_arr(str))
    arr2 = sort_lowest_to_highest(convert_string_to_arr(str))
    {
      highest_to_lowest: count_number_character(arr1),
      lowest_to_highest: count_number_character(arr2)
    }
  end

  def sort_highest_to_lowest array
    is_sorted = true
    while is_sorted do
      is_sorted = false
      (array.length - 1).times do |index|
        if array[index] < array[index + 1]
          array[index], array[index + 1] = swap(array[index], array[index + 1])
          is_sorted = true
        end
      end
    end
    array
  end

  def sort_lowest_to_highest array
    is_sorted = true
    while is_sorted do
      is_sorted = false
      (array.length - 1).times do |index|
        if array[index] > array[index + 1]
          array[index], array[index + 1] = swap(array[index], array[index + 1])
          is_sorted = true
        end
      end
    end
    array
  end


  def swap item1, item2
    temp = item1
    item1 = item2
    item2 = temp
    [item1 , item2]
  end

  # def uniq_element_array array
  #   _index = 0

  #   for index in 0..array.length - 1
  #     if array[index] != array[index + 1]
  #       array[_index] =  array[index]
  #       _index+= 1
  #     end
  #   end

  #   array[_index] = array[array.length - 1] 
  #   byebug
  #   byebug
  # end

  def is_in_array?(element, array)
    for i in 0..array.length
      return true if array[i] == element
    end

    false
  end

  def convert_string_to_arr str
    arr = []
    for index in 0..str.length - 1
      arr << str[index]
    end

    arr
  end

  def count_number_character array
    result = {}
    for index in 0..array.length - 1
      result["#{array[index]}"] = if result["#{array[index]}"].present?
        result["#{array[index]}"] + 1
      else
        1
      end
    end
    result
  end
end

