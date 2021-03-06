require 'spec_helper'

describe "Editing todo lists" do

  let!(:todo_list) {TodoList.create(title: "Groceries", description: "Grocery List")}

  def update_todo_list(options={})
    options[:title] ||= "My todo list"
    options[:description] ||= "This is my todo list."

    todo_list = options[:todo_list]

    visit "/todo_lists"
    within "#todo_list_#{todo_list.id}" do
      click_link "Edit"
    end

    fill_in "Title", with: options[:title]
    fill_in "Description", with: options[:description]
    click_button "Update Todo list"
  end


  it "Updates a todo list succesfully with correct information" do

    update_todo_list todo_list: todo_list, title: "New title", description: "New Description"

    todo_list.reload

    expect(page).to have_content("Todo list was successfully updated.")
    expect(todo_list.title).to eq("New title")
    expect(todo_list.description).to eq("New Description")
  end

  it "Returns an error if no title is provided" do
    update_todo_list todo_list: todo_list, title: ""
    expect(page).to have_content('error')
  end

  it "Returns an error if title is too short" do
    update_todo_list todo_list: todo_list, title: "Hi"
    expect(page).to have_content('error')
  end

  it "Returns an error if no description is provided" do
    update_todo_list todo_list: todo_list, description: ""
    expect(page).to have_content('error')
  end

  it "Returns an error if title is too short" do
    update_todo_list todo_list: todo_list, description: "New5"
    expect(page).to have_content('error')
  end




end
