initially installed latest version of Ruby from Homebrew

gem install rails

tried starting a new project

had permission issues:

Googled: `ERROR: While executing gem ... (Errno::EACCES) Permission denied @ rb_sysopen -`

1. https://forum.upcase.com/t/cannot-install-rails/4217/9
2. https://stackoverflow.com/questions/28846165/permission-error-when-trying-to-install-rails-osx

------

uninstalled Ruby using Brew

installed rbenv

Installed latest version of Ruby using rbenv

Add permission to .rbenv folder ==> *sudo chown -R abelregalado ~/.rbenv*

install Rails without a problem via ''gem install rails"

— > rails new <rails-project-name> (no permission issues for the first time ever)

------

starting rails project: 
get error: `Error loading the 'sqlite3' Active Record adapter. Missing a gem it depends on? can't activate sqlite3 (~> 1.3.6), already activated sqlite3-1.4.0. Make sure all dependencies are added to Gemfile. (LoadError)`

FIX: 
update <u>sqlite3 version</u> in Gemfile —> gem 'sqlite3', '~> 1.3.6'
then ==> `bundle install`

------

#### Creating Models

User Parent model: 
`rails generate model User type:string first_name:string last_name:string email:string`

<u>User</u> exists with type, first_name, last_name, email

Created Student Table as User subclass —> `rails generate model Student --parent User `

Created Sections Table —>  ` bin/rails generate model Section name:string date:datetime`

Created SectionStudent model and table —> `bin/rails generate model SectionStudent student:references section:references`

gives error:

```text
ActiveRecord::StatementInvalid (SQLite3::SQLException: no such table: main.students: INSERT INTO "section_students" ("student_id", "section_id", "created_at", "updated_at") VALUES (?, ?, ?, ?))
```

**<u>correction</u>**: rollback migration, use: `rake db:rollback STEP=1`
then,  update the SectionStudent model to reference **user** model rather than **student** model —> 
`bin/rails generate model SectionStudent student:references section:references` 

*Explanation: objects created on the Student model still show up on the User table via Single Table Inheritance, though are distinguished through the **type: 'student'** attribute*

`bin/rails generate model SectionStudent user:references section:references`

––force might be neccesary to overwrite the exisitng SectionStudent migration 

------

#### Adding Uniq Index on Joining Table to prevent duplicate relationships

create a migration that adds a unique index across multiple columns:
`add_index :section_students, [:user_id, :section_id], unique: true`

+++

#### Adding associations between Students and Sections

https://guides.rubyonrails.org/association_basics.html#choosing-between-has-many-through-and-has-and-belongs-to-many

##### MANY-TO-MANY ASSOCIATIONS:

`has_many :_, through: :_` **  **must match syntax (check if you missed the <u>through</u> colon)**
&& `has_and_belongs_to_many`

*Rule of thumb:* The simplest rule of thumb is that you should set up a `has_many :through` relationship if you need to work with the relationship model as an independent entity.

Methods added by has_many relationship: https://guides.rubyonrails.org/association_basics.html#methods-added-by-has-many
** 
.reload_<table_in_relationship>  :: revives the object/hash allowing to access the values at each key:value pair inside

------

#### Creating a Controller

###### Controllers are the classes of actions which handle requests to the Application. Each controller is it's own Class that contains Action methods. A specific action method is invoked upon a url being hit.

**define routes** in routes.rb ==> `HTTP_ACTION 'end-point' ===> 'controller#action'`

**generate a controller** in the app/controllers directory

+++

#### Creating Rake Tasks

###### Rake tasks are used to handle administrative tasks or commands.

Rake tasks are located in: `/lib/tasks/*.rake ` and can be executed with `rake` keyword before filename

`.rake` is the extension. **NOT** `.rb`: 

```
###### Rake convention #######

desc '...'
task :name do
  # task code ...
  # Rake::Task[:another_rake_task].invoke ==> invokes another rake task
end
```

Make sure to **require neccesary *gems* inside the task itself**

Include the neccesary environment/filesystem/Models that are required to interact with specific task

+++

#### touchNotes on Development: 

##### Create one diff/commit on every meaningul change.

 - example:
    - a migration,	
    -  updating/adding a controller, 
    - adding asociations, 
    - minor changes
    - leaving away from computer

------

#### Debugging: 

*byebug* —> opens up rails console to inspect the environment, inject code, etc.
JSON-formatter —> Chrome extension  

------

#### RESOURCES: 

https://www.ralfebert.de/snippets/ruby-rails/models-tables-migrations-cheat-sheet/

https://raw.githubusercontent.com/rails/rails/master/railties/lib/rails/generators/rails/model/USAGE

Rollback migrations: https://stackoverflow.com/questions/3647685/how-to-rollback-a-specific-migration

------

**QUESTIONS:** 

When would I want to include references associatiions versus creating a joinTable? Join table creates all of the columns in both tables into one??? 