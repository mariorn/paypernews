require 'rails_helper'

RSpec.describe "Users", type: :routing do

  before(:each) do
      @user = User.create({
            name: 'Test',
            email: 'test@testing.com',
            password: '12345678',
            password_confirmation: '12345678'
          })
  end


  it 'routes /users to the users controller' do
    expect(get(users_path)).to route_to(:controller => 'users', :action => 'index')
  end

  it 'routes /users/new to the users controller' do
    expect(get(new_user_path)).to route_to(:controller => 'users', :action => 'new')
  end

  it 'routes /users to the users controller' do
    expect(post(user_registration_path)).to route_to(:controller => 'registrations', :action => 'create')
  end

  it 'routes /users/:id/edit to the users controller' do
    expect(get(edit_user_path(@user.id))).to route_to(:controller => 'users', :action => 'edit', :id => "#{@user.id}")
  end

  it 'routes /users/:id to the users controller' do
    expect(patch(user_path(@user))).to route_to(:controller => 'users', :action => 'update', :id => "#{@user.id}")
  end

  it 'routes /users/:id to the users controller' do
    expect(put(user_path(@user))).to route_to(:controller => 'users', :action => 'update', :id => "#{@user.id}")
  end

  it 'routes /users/:id to the users controller' do
    expect(delete(user_path(@user))).to route_to(:controller => 'users', :action => 'destroy', :id => "#{@user.id}")
  end

end
