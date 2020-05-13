# frozen_string_literal: true

require 'spec_helper'

describe OmniAuth::Strategies::Cybozu do
  subject do
    described_class.new({})
  end

  context 'client options' do
    it 'returns correct authorize_url' do
      expect(subject.options.client_options.authorize_url).to eq('/oauth2/authorization')
    end

    it 'returns correct token_url' do
      expect(subject.options.client_options.token_url).to eq('/oauth2/token')
    end

    it 'has default skip_info' do
      expect(subject.options[:skip_info]).to eq(true)
    end
  end

  describe '#callback_url' do
    it 'returns callback url' do
      allow(subject).to receive(:full_host) { 'http://localhost' }
      allow(subject).to receive(:script_name) { '/v1' }
      expect(subject.callback_url).to eq 'http://localhost/v1/auth/cybozu/callback'
    end
  end
end
