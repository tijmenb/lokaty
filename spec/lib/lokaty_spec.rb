require 'lokaty'

describe Lokaty::Guess do

  LOCALHOST = '127.0.0.1'
  USA_IP = '198.35.0.0'
  SPANISH_IP = '2.143.255.255'
  GERMAN_IP = '5.10.85.47'

  describe "#country_code" do
    it 'detects localhost' do
      Lokaty::Guess.new(LOCALHOST).country_code.should be_nil
    end

    it 'detects US IP addresses' do
      Lokaty::Guess.new(USA_IP).country_code.should eq 'us'
    end

    it 'detects Spanish addresses' do
      Lokaty::Guess.new(SPANISH_IP).country_code.should eq 'es'
    end

    it 'detects German addresses' do
      Lokaty::Guess.new(GERMAN_IP).country_code.should eq 'de'
    end
  end

  describe "with fallbacks" do
    it 'uses a fallback if set' do
      Lokaty::Guess.new(SPANISH_IP, only: %w[gb us]).country_code.should be_nil
    end

    it 'uses a fallback if set' do
      Lokaty::Guess.new(LOCALHOST, fallback: 'nl').country_code.should eq 'nl'
    end

    it 'returns fallback for countries not in :only' do
      Lokaty::Guess.new(SPANISH_IP, only: %w[us de nl], fallback: 'nl').country_code.should eq 'nl'
    end

    it 'returns nil for countries not in :only' do
      Lokaty::Guess.new(SPANISH_IP, only: %w[us de nl]).country_code.should be_nil
    end
  end
end
