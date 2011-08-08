require 'spec_helper'

describe "sections/new.html.erb" do
  before(:each) do
    assign(:section, stub_model(Section,
      :name_en => "MyString",
      :name_no => "MyString",
      :festival_id => 1,
      :email => "MyString",
      :tag => "MyString",
      :description_en => "MyText",
      :description_no => "MyText"
    ).as_new_record)
  end

  it "renders new section form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sections_path, :method => "post" do
      assert_select "input#section_name_en", :name => "section[name_en]"
      assert_select "input#section_name_no", :name => "section[name_no]"
      assert_select "input#section_festival_id", :name => "section[festival_id]"
      assert_select "input#section_email", :name => "section[email]"
      assert_select "input#section_tag", :name => "section[tag]"
      assert_select "textarea#section_description_en", :name => "section[description_en]"
      assert_select "textarea#section_description_no", :name => "section[description_no]"
    end
  end
end
