require 'rails_helper'

RSpec.describe "recipelists/new", type: :view do
  before(:each) do
    assign(:recipelist, Recipelist.new(
      name: "MyString",
      preparation_time: "MyString",
      cooking_time: "MyString",
      description: "MyString",
      public: false
    ))
  end

  it "renders new recipelist form" do
    render

    assert_select "form[action=?][method=?]", recipelists_path, "post" do

      assert_select "input[name=?]", "recipelist[name]"

      assert_select "input[name=?]", "recipelist[preparation_time]"

      assert_select "input[name=?]", "recipelist[cooking_time]"

      assert_select "input[name=?]", "recipelist[description]"

      assert_select "input[name=?]", "recipelist[public]"
    end
  end
end
