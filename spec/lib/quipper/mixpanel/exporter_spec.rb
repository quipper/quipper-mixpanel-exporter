require 'spec_helper'

describe Quipper::Mixpanel::Exporter do
  let(:mixpanel_api_key) { SecureRandom.urlsafe_base64 }
  let(:mixpanel_api_secret) { SecureRandom.urlsafe_base64 }

  around do |ex|
    original_env = ENV.to_hash
    ENV['MIXPANEL_API_KEY'] = mixpanel_api_key
    ENV['MIXPANEL_API_SECRET'] = mixpanel_api_secret
    ex.run
    ENV.update(original_env)
  end

  subject { Quipper::Mixpanel::Exporter.new }

  describe '#initialize' do
    it 'sets mixpanel api key and api secret' do
      expect(subject.instance_variable_get(:@api_key)).to eq mixpanel_api_key
      expect(subject.instance_variable_get(:@api_secret)).to eq mixpanel_api_secret
    end
  end

  describe '#export' do
    it 'sends GET request to https://data.mixpanel.com' do
      expect(Quipper::Mixpanel::Exporter).to receive(:get) { |url|
        expect(url).to match(%r!\Ahttps://data\.mixpanel\.com!)
        expect(url).to match(%r!/api/2\.0/export/!)
        expect(url).to match(%r!api_key=#{mixpanel_api_key}!)
      }
      subject.export('/api/2.0/export/', {})
    end
  end

  describe '#api' do
    it 'sends GET request to https://mixpanel.com' do
      expect(Quipper::Mixpanel::Exporter).to receive(:get) { |url|
        expect(url).to match(%r!\Ahttps://mixpanel\.com!)
        expect(url).to match(%r!/api/2\.0/segmentation/!)
        expect(url).to match(%r!api_key=#{mixpanel_api_key}!)
      }
      subject.api('/api/2.0/segmentation/', {})
    end
  end
end
