require 'bakery-test'

describe "Vegimite Scroll" do
  it "Must give back the minimum number of packets"do
    expect(bakery_test("10 VS5")).to eq("2 x 5 $8.99")
  end
end

describe "Blueberry Muffin" do
  it "Must give back the minimum number of packets" do
    expect(bakery_test("14 MB11")).to eq("2 x 5 $8.99 3 x 2 $9.95")
  end
end

describe "Croissant" do
  it "Must give back the minimum number of packets" do
    expect(bakery_test("13 CF")).to eq("2 x 5 $9.95 1 x 3 $5.95")
  end
end
