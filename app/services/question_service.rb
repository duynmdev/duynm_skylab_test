class QuestionService
  # Implement Bubble Sort
  def answer_1 array=[]
    array = [9,1,8,2,7,3,6,4,5,10,13] unless array.present?

    {
      highest_to_lowest: sort_one_dimensional_array(array, :desc),
      lowest_to_highest: sort_one_dimensional_array(array, :asc)
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
    data = count_number_character(convert_string_to_arr(str))

    array_count_charater = convert_to_two_dimensional_array(data)

    {
      highest_to_lowest: convert_to_hash(sort_two_dimensional_array(array_count_charater, :asc)),
      lowest_to_highest: convert_to_hash(sort_two_dimensional_array(array_count_charater, :desc))
    }
  end

  def sort_one_dimensional_array array, type='asc'
    _array = array.dup
    is_sorted = true
    while is_sorted do
      is_sorted = false
      (_array.length - 1).times do |index|
        if (type == :asc ? (_array[index] > _array[index + 1]) : (_array[index] < _array[index + 1]))
          _array[index], _array[index + 1] = swap(_array[index], _array[index + 1])
          is_sorted = true
        end
      end
    end
    _array
  end

  def sort_two_dimensional_array array, type='asc'
    _array = array.dup
    is_sorted = true
    while is_sorted do
      is_sorted = false
      (_array.length - 1).times do |index|
        if (type == :asc ? (_array[index][1] > _array[index + 1][1]) : (_array[index][1] < _array[index + 1][1]))
          _array[index], _array[index + 1] = swap(_array[index], _array[index + 1])
          is_sorted = true
        elsif _array[index][1] == _array[index + 1][1]
          if (type == :asc ? (_array[index][0] < _array[index + 1][0]) : (_array[index][0] > _array[index + 1][0]))
            _array[index], _array[index + 1] = swap(_array[index], _array[index + 1])
            is_sorted = true
          end
        end
      end
    end
    _array
  end

  def swap item1, item2
    temp = item1
    item1 = item2
    item2 = temp

    [item1 , item2]
  end

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

    _array = []
    result.each do |item|
      _array << item
    end
    _array
  end

  def convert_to_two_dimensional_array hash_data={}
    two_dimensional_array = []
    for item in hash_data
      two_dimensional_array << item
    end

    two_dimensional_array
  end

  def convert_to_hash two_dimensional_array
    hash_data = {}
    for i in 0..two_dimensional_array.length - 1
      hash_data["#{two_dimensional_array[i][0]}"] = two_dimensional_array[i][1]
    end
    hash_data
  end
end

