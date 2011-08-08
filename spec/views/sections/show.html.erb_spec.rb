require 'spec_helper'

describe "sections/show.html.erb" do
  before(:each) do
    @section = assign(:section, stub_model(Section,
      :name_en => "Name En",
      :name_no => "Name No",
      :festival_id => 1,
      :email => "Email",
      :tag => "Tag",
      :description_en => "MyText",
      :description_no => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name En/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name No/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Email/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Tag/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
