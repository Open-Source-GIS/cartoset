CARTOSET
========

Requirements.
-------------

The requirements you will need in order to run a Cartoset based project are:

 - valid Ruby interpreter (versions >=1.9.2 supported)
 - [rubygems](http://rubygems.org/pages/download)
 - [git](http://git-scm.com/)
 - [PostgreSQL 9.0](http://www.postgresql.org/download/)
 - [A cartoDB account](http://cartodb.com)

 If you are running linux you need to install some development libraries. The installation commands depend on the distro you're using, we provide them for ubuntu. You can also execute ``script/ubuntu_install.sh`` which installs all you need to run cartoset.

  - libxml2-dev
  - libxslt-dev
  - libcurl4-gnutls-dev

        $ sudo apt-get install libxml2-dev libxslt-dev libcurl4-gnutls-dev

  - install postgresql-9.0

        $ sudo apt-get install python-software-properties checkinstall
        $ sudo add-apt-repository ppa:pitti/postgresql
        $ sudo add-apt-repository ppa:ubuntugis/ubuntugis-unstable
        $ sudo apt-get update
        $ sudo apt-get install postgresql-9.0 postgresql-server-dev-9.0



Setting up a new Cartoset based project.
----------------------------------------

1. Create a new rails project. Version should be equal or greater than 3.1

2. Add the cartoset gem to the project Gemfile

4. Install all the gems in the Gemfile:

	$ bundle install

5. Start a new server session:

	$ rails server

6. Go to http://localhost:3000. It will redirect you to the setup wizard.

7. Go through the setup wizard. At some point you'll be asked to select a cartoDB table. This table must have the next columns:
    - title (string)
    - description (text)
    - the_geom (geometry - point type). This column is created by
      default in new empty tables in cartoDB.

8. When you finish the setup proccess, you will have your cartoset project configured!

9. Customize your cartoset project, adding some css styles and giving it some love!

10. You can also add your own controllers, or override the existing ones.
