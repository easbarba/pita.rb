require 'rails_helper'

RSpec.describe "stories/index", type: :view do
  before(:each) do
    assign(:stories, [
      Story.create!(
        body: "MyText",
        title: "Title",
        user: nil
      ),
      Story.create!(
        body: "MyText",
        title: "Title",
        user: nil
      )
    ])
  end

  it "renders a list of stories" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Title".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
