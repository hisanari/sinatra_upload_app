require_relative 'spec_helper.rb'
require_relative '../main.rb'

RSpec.describe MainApp do
  it 'root access' do
    get '/'
    expect(last_response).to be_ok
  end

  it 'show access' do
    get '/show'
    expect(last_response).to be_ok
  end
end