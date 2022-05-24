# Hello from the LogicalStreet team!

Thanks for your interest in joining the LogicalStreet team!

[Jump to the exercise instructions](#exercise-instructions)

As the first step in our hiring process we ask you to complete a technical exercise, we know this takes time, but we do this for a number of reasons:

- It's hard to gauge how someone will work with us from a CV/Resume alone
- Most people don't have a body of public work we can look through
- We don't like to do technical exercises during interviews, so we hope by doing this in your own time you can show us the true standard of your work

## What will happen after you submit your work?

Once you have submitted your work a member of our team will review it. This person will be looking for things like readability of the code, separation of concerns, reasonable spec coverage, etc. This process can take a few days.

If we are impressed with your work, we will organise a call to discuss your application further, usually via a video chat.

## Thank you!

We hugely appreciate you taking the time to undertake this exercise – we don't expect you to spend more than 2-3 hours on this.

We are really looking forward to receiving your completed submission, thank you once again.

---

# Exercise instructions

This is your own personal fork of a little internal app which is used by our customer service (CS) to list all orders made on our shop and allows the CS team to view information about them. They require a new feature to be added and they have also found a bug.

Our operations (OPS) team also uses this app to keep track of the amount of products they need to make per hour, however this feature is proving to be problematic on busy days.

We are hoping to receive 3 separate pull requests to your forked repository for each of the following:

1. The CS team have asked for a feature to cancel any order that has yet to be delivered. In addition to being able to cancel the order, the team have also asked that they can attach a comment to the order to record why the order has been cancelled.
2. There is a bug in the order index page, the product name is the same for every order, this needs to be fixed. (You might notice that the feature spec for this page is passing - this should be fixed first)
3. The OPS team need the Slots page to be faster, especially for busy weeks (hint: navigate to the week with the last day of seeded orders). Please describe where you think the issue(s) lie and provide your thoughts on how they might be resolved, including what you think about the view file and if you would structure the code differently. If time permits, implement your solution (or implement just enough to prove your solution).

## Some extra notes:

This is a Rails 6 application, using RSpec for specs and ERB for views, and we recommend you run it using Ruby 2.7, and the latest version of Bundler. Once you have the app checked out and have installed all gems, you should run `rails db:reset` to setup the database.

We are assuming that you are familiar with the process of getting Rails app setup and started, but please do let us know if you require any pointers.
