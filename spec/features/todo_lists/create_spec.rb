require 'spec_helper'

describe "Creating todo lists" do


  it "redirects to the todo list index page on sucess" do
    visit "/todo_lists"
    click_link "New Todo list"
    expect(page).to have_content("New todo_list")

    fill_in "Title", with: "My todo list"
    fill_in "Description", with: "This is what i'm doing today."
    click_button "Create Todo list"

    expect(page).to have_content("My todo list")
  end


  it "Displays and error when the todo list has no title" do
    expect(TodoList.count).to eq(0)

    visit "/todo_lists"
    click_link "New Todo list"
    expect(page).to have_content("New todo_list")

    fill_in "Title", with: ""
    fill_in "Description", with: "This is what i'm doing today."
    click_button "Create Todo list"

    expect(page).to have_content('error')
    expect(TodoList.count).to eq(0)

    visit "/todo_lists"
    expect(page).to_not have_content("This is what i'm doing today.")
  end


  it "Displays and error when the todo list has a title less than 3 characters" do
    expect(TodoList.count).to eq(0)

    visit "/todo_lists"
    click_link "New Todo list"
    expect(page).to have_content("New todo_list")

    fill_in "Title", with: "Hi"
    fill_in "Description", with: "This is what i'm doing today."
    click_button "Create Todo list"

    expect(page).to have_content('error')
    expect(TodoList.count).to eq(0)

    visit "/todo_lists"
    expect(page).to_not have_content("This is what i'm doing today.")
  end


   it "Displays and error when the todo list has a no description" do
    expect(TodoList.count).to eq(0)

    visit "/todo_lists"
    click_link "New Todo list"
    expect(page).to have_content("New todo_list")

    fill_in "Title", with: "My todo list"
    fill_in "Description", with: ""
    click_button "Create Todo list"

    expect(page).to have_content('error')
    expect(TodoList.count).to eq(0)

    visit "/todo_lists"
    expect(page).to_not have_content("This is what i'm doing today.")
  end

  it "Displays and error when the todo list has a no description" do
    expect(TodoList.count).to eq(0)

    visit "/todo_lists"
    click_link "New Todo list"
    expect(page).to have_content("New todo_list")

    fill_in "Title", with: "My todo list"
    fill_in "Description", with: "Hi"
    click_button "Create Todo list"

    expect(page).to have_content('error')
    expect(TodoList.count).to eq(0)

    visit "/todo_lists"
    expect(page).to_not have_content("This is what i'm doing today.")
  end
end
