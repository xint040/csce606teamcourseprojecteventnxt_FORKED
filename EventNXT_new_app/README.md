# README

TEAM FALL 2023

### Install ruby and rails

Please check whether you have the ruby and rails installed. 
```
ruby -v
```
Ruby version is 3.2.2
```
rails -v
```
The rails version is 7.0.4

If you don't have the ruby or rails. Please follow the below processes.

* Install ruby-3.2.0 using Ruby version manager
  * `rvm get stable`
  * `rvm install "ruby-3.2.0"`
  * `rvm use 3.2.0`

* Install PostgreSQL
  * `sudo apt-get update`
  * `sudo apt-get install postgresql postgresql-contrib libpq-dev`
  * PostgreSQL may require to create a role to allow rails to connect to the Postgre database. In AWS cloud9 ubuntu system, we executed `sudo -u postgres createuser --interactive ubuntu`

* Clone the latest git repo
  * `git clone https://github.com/CSCE-606-Event360/EventNXT.git`

* Change directory to the new app
  * `cd EventNXT/EventNXT_new_app` 

* Bundle install
  * `bundle install`

* Migrate Database
  * `rails db:migrate`

* Start server in local development environment
  * `rails s`
 
### Problems
1. If Bundler complains that the wrong Ruby version is installed,

    * rvm: verify that rvm is installed (for example, rvm --version) and run rvm list to see which Ruby versions are available and rvm use <version> to make a particular version active. If no versions satisfying the Gemfile dependency are installed, you can run rvm install <version> to install a new version, then rvm use <version> to use it.
    
    * rbenv: verify that rbenv is installed (for example, rbenv --version) and run rbenv versions to see which Ruby versions are available and rbenv local <version> to make a particular version active. If no versions satisfying the Gemfile dependency are installed, you can run rbenv install <version> to install a new version, then rbenv local <version> to use it.
    
    Then you can try bundle install again.

## How to run Test cases

#### Cucumber
In order to have the cucumber test be able to trigger javascript events, one have to make sure that selenium is installed. Here is the approach of doing it:
##### Step 1
We have to manually download the correct version of the chromedriver. Follow this link to download the chromedriver: https://googlechromelabs.github.io/chrome-for-testing/#stable

Under stable, choose the corresponding OS you have:
<img width="1256" alt="Screenshot 2023-11-20 at 8 43 37 AM" src="https://github.com/CSCE-606-Event360/Fall2023-PlaNXT/assets/32810188/5a32cd03-e603-41ac-bf80-e69331c44cbf">


##### Step 2
Setup the chromedriver
<b>Mac</b>
After downloading the chromedriver, unzip the folder and move the chromedriver executable file to the /usr/local/bin folder.
```
# assume you are in the unzip folder dir
mv chromedriver /usr/local/bin
```
After moving chromedriver in the **/usr/local/bin** dir, one can start running the cucumber test
* If you face “Error: “chromedriver” cannot be opened because the developer cannot be verified. Unable to launch the chrome browser“, you need to go to usr/local/bin folder and right-click chromeDriver file and open it. After this step, re-run your tests, chrome driver will work.
    
<b>Windows</b>
1. After the ChromeDriver executable file is extracted and moved to the desired location, copy that location to set its path in System’s environment variables (the path where the chromedriver.exe is put).

2. Add the path in the Environment Variables

*cucumber test cases:

```console
RAILS_ENV=test rake cucumber
```

*rspec test cases:

```console
bundle exec rspec
```

### Contacts:
 * Email the team if you have any questions:
  * Anirith Pampati: anirith@tamu.edu | text/call @ 9797210622
  * Pavan Kaushik Adluri: pkavu_1998@tamu.edu
  * Rakesh Kumar Pothineni: rakeshpothineni@tamu.edu




### The content below is by - TEAM SPRING 2023

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
