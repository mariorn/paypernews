
RSpec.describe UsersController, type: :controller do

  before do
      user = User.create({
            name: "Nombre1",
            email: "nombre@nombre.com",
            password: "12345678",
            password_confirmation: "12345678"
            })
        @user = User.last
        sign_in @user
        @users = User.all
  end

  it "returns the name of user" do
    get :index, user_id: @user.id
    expect(@user.name).to eq("Nombre1")
  end

  it "returns a list of users" do
    get :index, user_id: @user.id
    expect(assigns(:users)).to eq(@users)
  end

  it "returns the user is not an administrator" do
    get :index, user_id: @user.id
    expect(@user.is_admin?).to eq(false)
  end

  it "returns the user is not a writer" do
    get :index, user_id: @user.id
    expect(@user.is_writer?).to eq(false)
  end

end
