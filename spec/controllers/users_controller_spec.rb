require 'spec_helper'

describe UsersController do

  describe "GET 'show'" do

    context 'user_id is valid' do

      it 'returns http success' do
        get 'show', id: factory(:user).id

        response.should be_success
      end
    end

    context 'user_id is invalid' do

      it 'raises a 404 error' do
        expect { get 'show', id: 100000 }.to raise_error(ActionController::RoutingError, 'Not Found')
      end
    end
  end
end
