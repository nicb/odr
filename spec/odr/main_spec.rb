require 'spec_helper'

describe Odr::Execute do

  before :example do
    @json_simple_data = '{ "one": [1, 2, 3], "two": 2, "three": 3 }'
    @sample_uri = 'http://wfs-kbhkort.kk.dk/k101/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=k101:trafiktal&outputFormat=json&SRSNAME=EPSG:4326'
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

  it 'can be called from main' do
    begin
      output = StringIO.new
      args = { list_keys: true, uri: [ @sample_uri ] }
      Odr::Execute.main(output, args)
      expect(output.size).to be > 0
    ensure
      output.close
    end
  end

end
