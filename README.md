# README

## Versions
* Ruby 2.5.5
* Rails 6.0.0
* SQLite3 1.4.1

## Deploy (Local)
* git clone https://github.com/kenharsch/test_double.git
* cd test_double
* rvm install 2.5.5
* rvm use 2.5.5
* bundle install
* rails active_storage:install
* rake db:create
* rake db:migrate
* rails s -p 3000 
  - Navigate in browser to: http://localhost:3000

## Upload Files
* Can be uploaded via "New Upload" link on landing page
* Once uploaded, "Process File" button on the show page runs the processing methods
* Results of processing (list of account numbers and their status) is shown on process completion

## Test Cases
* Test Case files have been added to git repo and can be uploaded through the interface
* Due to time constraints, there are no validations around file type/format, etc

## Console
* rails c

