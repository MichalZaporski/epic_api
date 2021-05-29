require 'rails_helper'

describe 'AuthenticationTokenService' do
  describe '.call' do
    let(:token) { AuthenticationTokenService.call(1) }

    it 'returns an authentication token' do

      decoded_token = JWT.decode token, AuthenticationTokenService::HMAC_SECRET, true, { algorithm: AuthenticationTokenService::ALGORITHM_TYPE }

      expect(decoded_token).to eq(
        [
          {"user_id"=>1}, # payload
          {"alg"=>AuthenticationTokenService::ALGORITHM_TYPE} # header
        ]
      )
    end
  end
end