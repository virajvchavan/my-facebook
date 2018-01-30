RSpec.describe UsersController do

  it 'renders the index template' do
    get :index
    expect(response.status).to eq(200)
    assert_template 'users/index'
  end

  it "text" do
    get :destroy
    expect(response).to redirect_to(root_path)
  end
end
