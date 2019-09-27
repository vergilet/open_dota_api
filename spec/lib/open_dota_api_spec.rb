# frozen_string_literal: true

require 'spec_helper'

describe OpenDotaApi do
  it 'returns a version number' do
    expect(OpenDotaApi::VERSION).not_to be nil
  end

  it 'respond to the client' do
    expect(OpenDotaApi.client).to be_a(OpenDotaApi::Client)
  end
end
