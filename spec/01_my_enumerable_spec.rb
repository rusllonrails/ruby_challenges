require "./samples/01_my_enumerable.rb"

describe "My Enumerable Module" do
  let(:sequence) do
    #
    # It will generate following sequence with 5 elements
    # starting from 0 and with step 5:
    #
    # [0, 5, 10, 15, 20]
    #
    Sequence.new(0, 5, 5)
  end

  it "should provide ability to iterate sequence via #map method" do
    res = sequence.map { |x| x + 1 }

    expect(res).to be_eql(
      [1, 6, 11, 16, 21]
    )
  end

  it "should provide ability to iterate sequence via #each method" do
    sum = 0

    res = sequence.each do |element|
      sum += element + 2
    end

    # Sum should be:
    #
    # (0 + 2) + (5 + 2) + (10 + 2) + (15 + 2) + (20 + 2) = 60
    #
    expect(sum).to be_eql(60)

    #
    # Sequence#each should return iterating range
    #
    # 0..4
    #
    expect(res).to be_eql(0..4)
  end

  it "should provide ability to iterate sequence via #select method" do
    res = sequence.select { |x| x > 10 }

    expect(res).to be_eql(
      [15, 20]
    )

    res = sequence.select { |x| x.even? }

    expect(res).to be_eql(
      [0, 10, 20]
    )

    res = sequence.select { |x| x.odd? }

    expect(res).to be_eql(
      [5, 15]
    )
  end
end
