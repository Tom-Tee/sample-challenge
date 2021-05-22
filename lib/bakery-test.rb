CROISSANT_HASH = {
  9 => 16.99,
  5 => 9.95,
  3 => 5.95
}

VEGIMITE_HASH = {
  5 => 8.99,
  3 => 6.99
}

BLUEBERRY_HASH = {
  8 => 24.95,
  5 => 16.95,
  2 => 9.95
}

def crazy_algorithm(number_of_order, price_hash)
  number = number_of_order.to_i
  total_number_array = price_hash.keys
  total_number = price_hash.keys.inject(0, :+)
  hash_amount = price_hash.keys.length
  minimum_array = []
  algorithm_from_start = true
  i = 0
  counter = 0
  until number == 0
    # ONE
    if (number / total_number_array[i]) >= 1 && counter == 0
      minimum_array << total_number_array[i]
      number -= total_number_array[i]
      # ONE AND TWO
      elsif (number / total_number_array[i]) >= 1 && counter == 1
        minimum_array << total_number_array[i]
        number -= total_number_array[i]

      elsif (number / total_number_array[i+1]) >= 1 && counter == 1
        minimum_array << total_number_array[i+1]
        number -= total_number_array[i+1]

      elsif (number / total_number_array[i+2]) >= 1 && counter == 1
        minimum_array << total_number_array[i+2]
        number -= total_number_array[i+2]

      elsif (number / total_number_array[i]) >= 1 && counter == 2
        minimum_array << total_number_array[i]
        number -= total_number_array[i]

      elsif (number / total_number_array[i+2]) >= 1 && counter == 2
        minimum_array << total_number_array[i+2]
        number -= total_number_array[i+2]

      elsif (number / total_number_array[i+1]) >= 1 && counter == 3
        minimum_array << total_number_array[i+1]
        number -= total_number_array[i+1]

      elsif (number / total_number_array[i+1]) >= 1 && counter == 4
        minimum_array << total_number_array[i+1]
        number -= total_number_array[i+1]

      elsif (number / total_number_array[i+2]) >= 1 && counter == 4
        minimum_array << total_number_array[i+2]
        number -= total_number_array[i+2]
      else
      counter += 1
      minimum_array = []
      number = number_of_order.to_i
    end
  end
  minimum_array
end

def create_wording(order, array, bakery_hash)
  amount = 0
  counted_array = []
  array.each { |n| amount += bakery_hash[n] }
  string_creation = ""
  p array

  array.each do |number|
    counter = 1
    new_string = "#{counter} x #{number} $#{bakery_hash[number].to_s} "

    if string_creation.include?(bakery_hash[number].to_s)
      string_creation.gsub! counter.to_s, (counter+1).to_s
    else
      string_creation << new_string
    end
  end

  p string_creation
  "#{order} $#{amount.round(2)} #{string_creation}"
end



def bakery_test(order)
  order_split = order.split(" ")
  if order_split[1] == "VS5"
    v_arr = crazy_algorithm(order_split[0], VEGIMITE_HASH)
    create_wording(order, v_arr, VEGIMITE_HASH)
  elsif order_split[1] == "MB11"
    b_arr = crazy_algorithm(order_split[0], BLUEBERRY_HASH)
    create_wording(order, b_arr, BLUEBERRY_HASH)
  elsif order_split[1] == "CF"
    c_arr = crazy_algorithm(order_split[0], CROISSANT_HASH)
    create_wording(order, c_arr, CROISSANT_HASH)
  else
    return "Not a selection"
  end
end




p  bakery_test("14 MB11")
