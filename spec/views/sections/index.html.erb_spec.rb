require 'spec_helper'

describe "sections/index.html.erb" do
  before(:each) do
    assign(:sections, [
      stub_model(Section,
        :name_en => "Name En",
        :name_no => "Name No",
        :festival_id => 1,
        :email => "Email",
        :tag => "Tag",
        :description_en => "MyText",
        :description_no => "MyText"
      ),
      stub_model(Section,
        :name_en => "Name En",
        :name_no => "Name No",
        :festival_id => 1,
        :email => "Email",
        :tag => "Tag",
        :description_en => "MyText",
        :description_no => "MyText"
      )
    ])
  end

  it "renders a list of sections" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name En".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name No".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Tag".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
