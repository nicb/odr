require 'spec_helper'

describe Odr::CLI do

  before :example do
    @sample_uri = 'http://wfs-kbhkort.kk.dk/k101/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=k101:trafiktal&outputFormat=json&SRSNAME=EPSG:4326'
  end

  let(:valid_argv) { [ '--keys', @sample_uri ] }

  let(:help_argv) { [ '--help' ] }

  it 'runs with valid args' do
    begin
      output = StringIO.new
  
      Odr::CLI.execute(output, valid_argv)
      expect(output.size).to be > 0
    ensure
      output.close
    end
  end

  it 'runs with help args' do
    begin
      output = StringIO.new
  
      Odr::CLI.execute(output, help_argv)
      expect(output.size).to be > 0
    ensure
      output.close
    end
  end

end
