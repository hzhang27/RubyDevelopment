class Calculator
  def handle_newline_delimiter(numbers_to_add)
    numbers_to_add.sub!("\n", ",")
  end

  def guard_condition_reject_multiple_delimiters(numbers_to_add)
    raise(ArgumentError, "Multiple delimiters not allowed.") if numbers_to_add.include?(",,")
  end

  def handle_custom_delimiters(numbers_to_add)
    if numbers_to_add.match(/^\/\//)
      custom_delimiter = numbers_to_add[2]
      numbers_to_add = numbers_to_add[4..99]
      numbers_to_add.sub!(custom_delimiter, ",")
    end
    numbers_to_add
  end

  def guard_condition_reject_negative_numbers(numbers_to_add)
    if numbers_to_add.include?(",")
      negative_numbers = ""
      numbers_to_add.split(',').each { |i| negative_numbers += i + "," if i.to_i < 0 }
      raise(ArgumentError, "Negative numbers not allowed: " + negative_numbers) if negative_numbers.length > 0
    end
  end

  def add(numbers_to_add)
    numbers_to_add = handle_custom_delimiters(numbers_to_add)
    handle_newline_delimiter(numbers_to_add)
    guard_condition_reject_multiple_delimiters(numbers_to_add)
    guard_condition_reject_negative_numbers(numbers_to_add)
    return sum(numbers_to_add.split(',')) if numbers_to_add.include?(",")
    return numbers_to_add.to_i if numbers_to_add.length > 0
    return 0
  end

  def sum(numbers_array)
    return numbers_array.inject(0) { |total, number_string| total += number_string.to_i }
  end
end