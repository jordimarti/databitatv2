require "application_system_test_case"

class EntsTest < ApplicationSystemTestCase
  setup do
    @ent = ents(:one)
  end

  test "visiting the index" do
    visit ents_url
    assert_selector "h1", text: "Ents"
  end

  test "creating a Ent" do
    visit ents_url
    click_on "New Ent"

    fill_in "Category", with: @ent.category
    fill_in "Name", with: @ent.name
    fill_in "Reviewid", with: @ent.reviewid
    click_on "Create Ent"

    assert_text "Ent was successfully created"
    click_on "Back"
  end

  test "updating a Ent" do
    visit ents_url
    click_on "Edit", match: :first

    fill_in "Category", with: @ent.category
    fill_in "Name", with: @ent.name
    fill_in "Reviewid", with: @ent.reviewid
    click_on "Update Ent"

    assert_text "Ent was successfully updated"
    click_on "Back"
  end

  test "destroying a Ent" do
    visit ents_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ent was successfully destroyed"
  end
end
