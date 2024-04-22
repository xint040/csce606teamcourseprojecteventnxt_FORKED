#EventNXT Home Page
#CSCE 606 Project GitHub EventNXT Group Home Page - SPRING 2024

This is home page which has 2 apps: Old App & New App.
We, the students of Spring 2024, continued to worked on the EventNXT_new_app. For all the verification purposes please use the new app.

New App Link:

Spring 2024 Heroku link: https://eventnxt-0fcb166cb5ae.herokuapp.com/

Spring 2024 Github link: https://github.com/CSCE-606-Event360/Spring2024EventNXT/tree/main/EventNXT_new_app

Spring 2024 EventNXT code climate report: https://codeclimate.com/github/CSCE-606-Event360/Spring2024EventNXT

**Warning: For deep issues, bugs and problems, see debugging_report.txt file for the new app. This file will be continuously updated
whenever it is necessary to provide notifications/clarifications on any reported and found issues, bugs and the corresponding problems.**


**Spring 2024 EventNXT Development Team**


------------------------------------------------------IMPORTANT------------------------------------------------------

We strongly suggest the Team to go through the DOCUMENTATION to understand the old and new application:

Documentation is common for PlanNXT, CastNXT and EventNXT:

Email the team if you have any questions:

Install ruby and rails

Please check whether you have the ruby and rails installed.

ruby -v

Ruby version is 3.2.2 as mentioned in Gemfile

rails -v

The rails version is 7.0.4

If you don't have the ruby or rails. Please follow the below processes.

    Install ruby-3.2.0 using Ruby version manager
        rvm get stable
        rvm install "ruby-3.2.0" or try rvm install "ruby-3.2.2"
        rvm use 3.2.0 or try rvm use 3.2.2

    Install PostgreSQL
        sudo apt-get update
        sudo apt-get install postgresql postgresql-contrib libpq-dev
        
        PostgreSQL may require to create a role to allow rails to connect to the Postgre database. In AWS cloud9 ubuntu system, we executed 
        sudo -u postgres createuser --interactive ubuntu

    Clone the latest git repo
        git clone https://github.com/CSCE-606-Event360/Spring2024EventNXT.git

    Change directory to the new app
        cd Spring2024EventNXT/EventNXT_new_app

    Bundle install
        bundle install

    Set ENVIRONMENT VARIABLES
        NXT_APP_URL -> events360 website link
        NXT_APP_ID -> client ID (registered with events360)
        NXT_APP_SECRET -> client secret (registered with events360)
        EVENT_NXT_APP_URL -> eventNXT WEBSITE LINK.
        ALLOWED_HOST -> eventnxt url in heroku or local url

    To set environment variables, please follow below procedure: command:
        export NXT_APP_URL="http://events360.herokuapp.com/"
        export NXT_APP_ID="aCgXCUDxHSvkp12ZaLweRSVq0pmznGpFasldrE3EZpQ"
        export NXT_APP_SECRET="iN9O2qGyA9n3nauMXOl6x5SDh08i27Nb1gs-fIjI6g0"
        export EVENT_NXT_APP_URL="https://eventnxtprodfall2023-a37dec4f8dd9.herokuapp.com/" #your eventnxt app url in development heroku
        export ALLOWED_HOST="your eventnxt app url in development heroku"

NOTE: NXT_APP_URL, NXT_APP_ID, NXT_APP_SECRET are env variables used for oauth client registration with CRM event360 server. http://events360.herokuapp.com/ is customer production CRM server. You should not use this for development. For development you need to clone Event360 repo and run the app. This admin login details are present in db/seeds.rb file of Event360 repo. Then you can go to application management and create a new test client. once the new client is registered you can get NXT_APP_ID and NXT_APP_SECRET from the UI and set it in your development env as shown above. you need to save client callback in this new test client in event360 app. To get an Idea:

    go to http://events360.herokuapp.com/, login as admin user, use same login details as mentioned above from seeds.rb file in Event360 repo.
    go to EventNXT and look for the fields to get idea.

    Migrate Database
        rails db:migrate

    Start server in local development environment
        rails s

Problems
If Bundler complains that the wrong Ruby version is installed,
    rvm: verify that rvm is installed (for example, rvm --version) and run rvm         list to see which Ruby versions are available and rvm use to make a particular     version active. If no versions satisfying the Gemfile dependency are               installed, you can run rvm install to install a new version, then rvm use to       use it.

    rbenv: verify that rbenv is installed (for example, rbenv --version) and run       rbenv versions to see which Ruby versions are available and rbenv local to         make a particular version active. If no versions satisfying the Gemfile            dependency are installed, you can run rbenv install to install a new version,      then rbenv local to use it.

    Then you can try bundle install again.

How to run Test cases

*cucumber test cases:
    RAILS_ENV=test rake cucumber

*rspec test cases:
    bundle exec rspec

Heroku Deployment:
It is highly recommended to push the app to heroku using the "Container Registry" method:

1. Download and install the Heroku CLI.

2. Log in to your Heroku account and follow the prompts to create a new SSH public key.
        heroku login

4. Log in to Container Registry. You must have Docker set up locally to continue. You should see output when you run this command.
        docker ps

5. Push your Docker-based app. Build the Dockerfile in the current directory and push the Docker image
        heroku container:push web -a <your_image>

6. Deploy the changes. Release the newly pushed images to deploy your app.
        heroku container:release web -a <your_image> 
   
7. Use your app link to visit your app.

Note: If you notice that your app run into an Application Error.

1. Check your Gemfile.
        Check if your Gemfile has "gem "pg""

2. Run "bundle install"

3. Now, navigate to your app from the heroku dashboard

4. Click on "More" (Top-Right corner, next to 'Open App')

5. Click on "Run console"

6. On the command prompt, run the command:
        "rails db:migrate"

8. Now, try opening the app.

- Contacts:
                
                        Anirith Pampati: anirith@tamu.edu | text/call @ 9797210622
                        Amalesh Arivanan: amalesh.arivanan-22@tamu.edu
                        Louis Turrubiartes: louis.turrubiartes@tamu.edu
                        Alex Wise: alex2by4@tamu.edu
                        Tianchen Huang: th20@tamu.edu
                        Tong Wu: syca.red@tamu.edu
                        Xin Tong: xintong@tamu.edu
  
