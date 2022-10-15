require 'rails_helper'

RSpec.describe "stories/edit", type: :view do
  let(:story) {
    Story.create!(
      body: "MyText",
      title: "MyString",
      user: nil
    )
  }

  before(:each) do
    assign(:story, story)
  end

  it "renders the edit story form" do
    render

    assert_select "form[action=?][method=?]", story_path(story), "post" do

      assert_select "textarea[name=?]", "story[body]"

      assert_select "input[name=?]", "story[title]"

      assert_select "input[name=?]", "story[user_id]"
    end
  end
end
