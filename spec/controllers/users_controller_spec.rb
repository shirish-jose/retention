require 'spec_helper'

describe UsersController do
  include Devise::TestHelpers

  describe "GET 'show'" do

    context 'admin is not logged in' do

      it 'redirects to sign in page' do
        get 'show', id: factory(:user).id

        response.should redirect_to(new_admin_session_path)
      end
    end

    context 'admin is logged in' do
      before(:each) { sign_in(factory(:admin)) }

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
end
