require 'spec_helper'

describe Odr::Execute do

  before :example do
    @json_simple_data = '{ "one": [1, 2, 3], "two": 2, "three": 3 }'
  end

  it 'can list the keys of a given data set in JSON format' do
    begin
      expect((data = MultiJson.load(@json_simple_data)).class).to be(Hash)
      output = StringIO.new
  
      Odr::Execute.send(:print_keys, output, data)
      expect(output.size).to be > 0
      output.rewind
      expect(output.read).to eq("%-20s %10d\n%-20s %10d\n%-20s %10d\n" % [ 'one:', 3, 'two:', 1, 'three:', 1 ])
    ensure
      output.close
    end
  end

end
