# Instalation

Clone the project, open it's folder and run bundle install:

    bundle install

After all the gems got installed, run the migrations:

    rake db:migrate

Now you need to run the server:

    rails server

To open the page follow this [link](http://localhost:3000) or on your browser go to this address:

    http://localhost:3000

# Utilization
Click on the select file button, select your file and open it.
Press the "Import new file" button.
The file will be uploaded and parsed.
You will se a page with the data of the file and the imported data.

You can get back to the main page with the button on the bottom.
On the main page, you will see the list of other files that has been uploaded.
Each file has two buttons, one you can open again that file and see the results and another to delete the data.

# Testing

Create the test database:

    rake db:create db:migrate RAILS_ENV=test

Run the RSPEC:

    bundle exec rspec