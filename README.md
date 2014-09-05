# README

This was a one-day project that Cohort 5 of Nashville Software School went through.

[![Build Status](https://travis-ci.org/elizabrock/student_picker.png?branch=master)](https://travis-ci.org/elizabrock/student_picker)
[![Code Climate](https://codeclimate.com/github/elizabrock/student_picker.png)](https://codeclimate.com/github/elizabrock/student_picker)
[![Code Climate](https://codeclimate.com/github/elizabrock/student_picker/coverage.png)](https://codeclimate.com/github/elizabrock/student_picker)


## Ruby version

2.1.2

## System dependencies

None

## Setup and Configuration

1. _Copy_ config/database.yml.example to config/database.yml.
2. (Optional) Make any changes to database.yml that are necessary for your database setup.
3. Run `rake db:create:all`
4. `rake db:migrate`
5. Run the test suite: `rake`

To run the server locally using unicorn:

`bundle exec unicorn -p 3000 -c ./config/unicorn.rb`

## Deployment instructions

_(Pending)_
