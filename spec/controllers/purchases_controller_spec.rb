require 'spec_helper'

describe PurchasesController do
  include Devise::TestHelpers

  describe "GET 'index'" do

    context 'not logged in' do

      it 'redirects to sign in page' do
        get 'index'

        response.should redirect_to(new_admin_session_path)
      end
    end

    context 'admin logged in' do

      it 'should be successful' do
        sign_in(factory(:admin))

        get 'index'

        response.should be_success
      end
    end
  end
end
