initially installed latest version of Ruby from Homebrew

gem install rails

tried starting a new project

had permission issues:

Googled: `ERROR: While executing gem ... (Errno::EACCES) Permission denied @ rb_sysopen -`

1. https://forum.upcase.com/t/cannot-install-rails/4217/9
2. https://stackoverflow.com/questions/28846165/permission-error-when-trying-to-install-rails-osx

++++++

uninstalled Ruby using Brew

installed rbenv

Installed latest version of Ruby using rbenv

Add permission to .rbenv folder ==> *sudo chown -R abelregalado ~/.rbenv*

install Rails without a problem via ''gem install rails"

— > rails new <rails-project-name> (no permission issues for the first time ever)

++++

starting rails project: 
try: `rails generate model User first_name:string last_name:string email:string`
get error: `Error loading the 'sqlite3' Active Record adapter. Missing a gem it depends on? can't activate sqlite3 (~> 1.3.6), already activated sqlite3-1.4.0. Make sure all dependencies are added to Gemfile. (LoadError)`

FIX: 
update <u>sqlite3 version</u> in Gemfile —> gem 'sqlite3', '~> 1.3.6'
then ==> `bundle install`

retry: `rails generate model User first_name:string last_name:string email:string`

**Success!** 

Now, run `bin/rails db:migrate` 

+++

Model: User exists with first_name, last_name, email

created Student Table as User subclass —> `rails generate model Student --parent User `

Created Sections Table —>  ` bin/rails generate model Section name:string date:datetime`

Created SectionStudent model and table —> `bin/rails generate model SectionStudent student:references section:references`

**<u>correction</u>**: rollback migration, use: `rake db:rollback STEP=1`
then, update the SectionStudent model to reference **user** rather than **student** model

Explanation: objects created on the Student model still show up on the User table via Single Table Inheritance, though are distinguished through the **type: 'student'** attribute

`bin/rails generate model SectionStudent user:references section:references`

––force might be neccesary to overwrite the exisitng SectionStudent migration 

+++

RESOURCES: 
https://www.ralfebert.de/snippets/ruby-rails/models-tables-migrations-cheat-sheet/

https://raw.githubusercontent.com/rails/rails/master/railties/lib/rails/generators/rails/model/USAGE

Rollback migrations: https://stackoverflow.com/questions/3647685/how-to-rollback-a-specific-migration

---

**QUESTIONS:** 

When would I want to include references associatiions versus creating a joinTable? Join table creates all of the columns in both tables into one??? 