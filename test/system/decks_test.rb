require "application_system_test_case"

class DecksTest < ApplicationSystemTestCase
  setup do
    @deck = decks(:one)
  end

  test "visiting the index" do
    visit decks_url
    assert_selector "h1", text: "Decks"
  end

  test "creating a Deck" do
    visit decks_url
    click_on "New Deck"

    fill_in "Ahead", with: @deck.Ahead
    fill_in "Opponentdeck", with: @deck.Opponentdeck
    fill_in "Mydeck", with: @deck.mydeck
    fill_in "Result", with: @deck.result
    click_on "Create Deck"

    assert_text "Deck was successfully created"
    click_on "Back"
  end

  test "updating a Deck" do
    visit decks_url
    click_on "Edit", match: :first

    fill_in "Ahead", with: @deck.Ahead
    fill_in "Opponentdeck", with: @deck.Opponentdeck
    fill_in "Mydeck", with: @deck.mydeck
    fill_in "Result", with: @deck.result
    click_on "Update Deck"

    assert_text "Deck was successfully updated"
    click_on "Back"
  end

  test "destroying a Deck" do
    visit decks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Deck was successfully destroyed"
  end
end
