require 'rails_helper'

RSpec.describe "recipelists/index", type: :view do
  before(:each) do
    assign(:recipelists, [
      Recipelist.create!(
        name: "Name",
        preparation_time: "Preparation Time",
        cooking_time: "Cooking Time",
        description: "Description",
        public: false
      ),
      Recipelist.create!(
        name: "Name",
        preparation_time: "Preparation Time",
        cooking_time: "Cooking Time",
        description: "Description",
        public: false
      )
    ])
  end

  it "renders a list of recipelists" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Preparation Time".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Cooking Time".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Description".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
  end
end
