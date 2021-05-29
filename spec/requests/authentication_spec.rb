require 'rails_helper'

describe 'Authentication', type: :request do
  describe 'POST /authentication' do
    let(:user) { FactoryBot.create(:user, email: 'test@test.com', name: 'Michel', surname: 'Testowy', password: 'Secret') }

    it 'authenticates the client' do
      jwt = AuthenticationTokenService.call(user.id)
      post '/api/v1/authentication', params: { email: user.email, password: user.password }

      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)).to eq({
        'token' => jwt
      })
    end

    it 'returns error where there is no email' do
      post '/api/v1/authentication', params: { password: 'Secret' }

      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'returns error where there is no password' do
      post '/api/v1/authentication', params: { email: 'TestName' }

      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'return error where the password is incorrect' do
      post '/api/v1/authentication', params: { email: user.email, password: 'bad_password' }

      expect(response).to have_http_status(:unauthorized)
    end
  end
end