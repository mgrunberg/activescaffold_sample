require 'rails_helper'

RSpec.describe "Categories", type: :feature do
  let!(:category) { create :category }

  it "visiting the index" do
    visit categories_path
    expect(page).to have_css "h2", text: "Categories"
  end

  it "should have text-input on search inputs" do
    visit categories_path

    click_link "Search"

    expect(page).to have_css "#search_name.text-input", count: 1
  end

  it "creating a Category" do
    visit categories_path

    click_link "Create New"

    fill_in "Name", with: Faker::Lorem.word

    click_button "Create"

    expect(page).to have_css ".categories-view .records .record", count: 2
  end

  it "updating a Category" do
    new_name = "#{category.name}a"

    visit categories_path
    click_link "Edit"

    fill_in "Name", with: new_name

    click_button "Update"

    expect(page).to have_css ".categories-view .records .record", count: 1
    expect(page).to have_content new_name
  end

  it "destroying a Category" do
    visit categories_path
    page.accept_confirm do
      click_link "Delete"
    end

    expect(page).to have_no_css ".categories-view .records .record"
  end
end
