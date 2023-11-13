# README

## Introduction

The major fault of this legacy app has been faulty authentication, which allowed every user to visit the event dashboard regardless of being logged in, i.e., lack of security. In addition, it was not possible to connect the app to the central authentication developed by the CRM team. After several attempts and meetings with the instructor, we decided to redesign and build a new Ruby-on-Rails app from scratch, which not only imitates all the existing features of the old app, but all also provides the following benefits:

* Fully functional authentication
* Secure app, i.e., no access to any page unless the user is signed into the app.
* Multiple registration methods, including EventNXT-based registration and Google registration, which allows users to register via their gmail account.
* Easy integration to the CRM’s central authentication system
* Faster operation
* Using only Ruby language, i.e., no hacky implementation
* No Javascript implementation
* Replicable features, i.e., similar features have similar implementations
* Comprehensive explanation of changes made to each line of the application.

On top of all these benefits, we only focused on implementing features instead of spending time on styling with CSS or Bootstrap. We believe that front-end changes can be done when all features are implemented. Since there are still some features remaining to be completed, we did not add any front-end styling to the new app to make it easier for the next team to understand the codes.


## Naming Convetion for Branches

The repo contains multiple branches. Keep in mind that the "main" branch does not have the changes made in any of other branches.

Multiple branches are made to clearly shows the development process of the app. The naming convention used for each branch is **`AI_<feature name>_<iteration number>_<next feature name>_<iteration number>`**. For example, **`AI_home_001_event_005`** means that the first implemented feature is a **home page** with only one iteration and the next feature implemented after **home page** is **event dashboard** with 5 iterations.

To avoid long names, the naming restarted after **`AI_home_001_event_005_seat_001_guest_001_devise_001_omniauth_001_mailer_006`**, i.e., the next branch built on top of this branch is **`AI_mailer006_simplecov_001`**.


## How to Load the new Application

The following simple steps should be taken to deploy the app into your local machine. Same steps can be used for Amazon Web Service (AWS) Cloud-9 as well.

1. Check if Ruby, Rails, and Bundle are installed

```sh
$ ruby -v
$ rails -v
$ bundle -v
```

2. If you are using AWS-Cloud9, you can install all these by running the following commands. Please make sure you’re not entered the app folder yet. Run the following command in your created environment, before entering your app’s local folder.

```sh
# For Amazon Linux:
$ sudo yum -y update
$ sudo yum -y install ruby

# Update RVM by running:
$ rvm get stable

# Install ruby version:
$ rvm install 3.1.2

# Set default version in RVM
$ rvm --default use 3.1.2

# Update/install bundler
$ gem install bundler

# Update/install rails
$ gem install rails
```

3. Now, you can clone the app’s GitHub repo and run the app on your local server.

```sh
$ git clone <github repo>
$ cd <app name>
$ bundle install
$ rails db:migrate
$ rails s
```

4. If you are using AWS-Cloud9, you will get access to the web app via “Preview”. You will probably be asked to add the host address to your app’s environment. For example, in the case of development, you may put the following code line in your “development.rb” located at “config/environments/developement.rb”. Change the URL with your own AWS cloud-9 url. Now, you will be able to rerun the server and preview the app.

```ruby
config.hosts << "da8311—-.vfs.cloud9.us-east-2.amazonaws.com"
```


## To-Do List (partial) for the Next Team for the New App

The following items need to be implemented.

1. **Test Cases (Rspec and Cucumber):** some Rspec tests are written for the new app. The new team should develop more tests cases for every single feature. You can get some ideas on how to write them by looking at the tests written for the old app.

2. **Add CRM Authentication:** the new app already has two authentication methods, you need to add another option to allow users to use the central authentication developed by the CRM team.
Associate Event to each User: the app currently allows all users to see all the created events. You need to associate each event to each user that limits the signed-in users to only see their own created events, not others. You can find numerous online tutorials on how to do it.

3. **Mailer System:** the event organizers were able to send individual or bulk emails to the guests in the old app. You can find all the mailing templates in the old app. You need to transfer those into the new app. Furthermore, you should allow every event organizer to be able to send emails from their own email address. The app is currently configured in a way that only allows certain gmail addresses to send email from. You can learn more about it online by searching how to send email from gmail in the third-party app. As a hint, there are some other mailer service providers, such as “mailgun” and “sendgrid” that may be the way to allow sending emails from any email address.

4. **Referral System:** the referral system header is only placed in the show page of each event, but nothing about referral is implemented in the new app. You need to fully understand what exactly the client wants for this system and learn from the implemented referral system in the old app. Then you can implement a fully functional referral system.

5. **Inline CRUD Scaffold:** rails recently introduced a very powerful tool called “Hotwire” to create dynamic tables. From which, you can create inline editable tables inside any page of the app. It is highly suggested to learn and implement it for this app, instead of using Javascript.

6. **CSS Styling:** it is highly suggested to do styling after all features are implemented in ruby language. Styling or front-end changes can be done as the final step of building the app.

7. **Test Cases (Rspec and Cucumber):** to remind you, don’t forget to write test cases!