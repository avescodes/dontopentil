require 'spec_helper'

describe GiftsController do
  describe "PUT #create" do
    context "when no params are passed" do
      When { put :create, :format => :json }
      Then { expect(response.status).to eql(500) }
    end

    context "when a url and a date" do
      Given (:gift_url)  { "http://gift/url" }
      Given (:some_url)  { "http://original" }
      Given (:some_date) { "20140110" } 
      Given { GiftsRepository.stub(:create).with(some_url, some_date).and_return gift_url } 
      When  { put :create, :url => some_url, :date => some_date, :format => :json }
      Then  { expect(response.body).to eql(gift_url) }
      And   { expect(response).to be_success }
    end
  end
end
