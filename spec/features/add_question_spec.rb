require "rails_helper"
ActiveRecord::Base.shared_connection = nil
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation
DatabaseCleaner.start

describe "the add a question process" do
  let(:user) { FactoryGirl.create(:user) }

  before do
    sign_in(user)
  end

  it "adds a new question", js: true do
    visit "/"
    click_on "New Question"
    fill_in "Title", with: 'test title'
    fill_in "Body", with: 'bs'
    click_on "Create Question"
    expect(page).to have_content 'test title'
DatabaseCleaner.clean
  end
end
