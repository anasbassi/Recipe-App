require 'rails_helper'

RSpec.describe "recipelists/edit", type: :view do
  let(:recipelist) {
    Recipelist.create!(
      name: "MyString",
      preparation_time: "MyString",
      cooking_time: "MyString",
      description: "MyString",
      public: false
    )
  }

  before(:each) do
    assign(:recipelist, recipelist)
  end

  it "renders the edit recipelist form" do
    render

    assert_select "form[action=?][method=?]", recipelist_path(recipelist), "post" do

      assert_select "input[name=?]", "recipelist[name]"

      assert_select "input[name=?]", "recipelist[preparation_time]"

      assert_select "input[name=?]", "recipelist[cooking_time]"

      assert_select "input[name=?]", "recipelist[description]"

      assert_select "input[name=?]", "recipelist[public]"
    end
  end
end
