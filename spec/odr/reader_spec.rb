require 'spec_helper'

describe Odr::Reader do

  include Odr::Reader

  before :example do
    @url = 'http://www.google.com' # something predictable :-)
  end

  it 'can read urls and uris' do
    expect(read(@url).empty?).to be false
  end

end

