def vegimite_scroll(number_of_order)

end

def blueberry_muffin(number_of_order)

end

def croissant(number_of_order)

end


def bakery_test(order)
  order_split = bakery_test.split(" ")
  if order_split[1] == "VS5"
    vegimite_scroll(order_split[0])
  elsif order_split[1] == "MB11"
    blueberry_muffin(order_split[0])
  elsif order_split[1] == "CF"
    blueberry_muffin(order_split[0])
  else
    return "Not a selection"
  end
end


bakery_test("10 VS5")
