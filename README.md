## Challenge

Create a small Ruby on Rails application that can do basic inventory management for a car dealership manager (the user). We will not be judging based on front-end appearance only functionality and best practices, there’s no need to include a front-end framework. We expect a simple setup for the database and server, this is intended to be a short exercise for discussion during your interview.

## Specifications

- [ ] Users can log in and can have type “user” or “admin”
- [x] Users can view the inventory of cars and their details
- [x] “Admin” users can add and delete cars from the inventory
- [x] Cars are located at a dealership, there may be multiple dealerships

About the cars
- [x] Have a monetary price. The price depreciates 2% every month.
- [x] Can be new or used

Please include at least two tests
- [x] You may choose which kind of tests to write (unit, integration...)


## Setup Ruby (only if you have not installed)

This project uses [asdf](https://asdf-vm.com/#/). \
Follow the installation [instructions](https://asdf-vm.com/#/core-manage-asdf?id=asdf)

After installation you need to follow these steps:

```bash
# Add ruby plugin on asdf
$ asdf plugin add ruby

# Install ruby plugin
$ asdf install ruby 2.7.4

# Set the default ruby for the project
$ asdf local ruby 2.7.4
```

## Setup Project

```bash
# install bundler
$ gem install bundler

# run bundle to install gems
$ bundle
```

## Admin user

username: admin
password: secret

## Decisions

The project was built following the pattern of a Rails project. I first built the car routine to be delivered to the admin users. So they can evaluate and give feedback if the data is available for the cars.

Then I implemented an authentication in a simple way so that the project could be made available to common users without requiring authentication.

In the next step I would develop the dealership part so users could know where the car is located.

In the next step I would develop more complete authentication.

## About the time

- hours

## Improvements

- [x] Create dealership
- [x] Add relationship between car and dealership
- [x] Tests to routes
- [x] Tests to controllers (requests)
- [ ] Tests for view
- [ ] Authorization system
- [ ] Rubocop
- [ ] Codeclimate
- [ ] Add images at the cars
