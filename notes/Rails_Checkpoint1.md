#### Basic

- Overview of the Ruby on Rails framework.
  - The RoR framework enables developers to focus on writing the logic of their application by having most of the application already built out. RoR is an MVC framwork built on top of Ruby, and is highly flexible and configurable using Ruby Gems. 
- What are the pieces and how do they fit together
  - Model: defines the shape of the data from the database, and provides and interface between relational database and Ruby. Model is a subsystem implemented through Active Records library, which allows Developers to access data through an object style lookup and access.
  - Controller: Controllers are methods in objects that are invoked to query for specific data, and organizing that data, from searching, sorting and messaging it. Controller methods are invoked by calling endpoints 

#### Data modeling

- What is a model in Ruby on Rails? 
  - Rails models dictate the shape, fields and associations of the Data Objects that will be stored in the database. Models are translated or mapped to Database objects and are accesible via Active Record operation/lookups.    
- How do you create a Model?
  - You can create a model via the console using `bin/rails generate model <model_name> <other attributes or associations or parents>`
- How do you query data from a Model?
  - To query data from a Model, you can use Active Record query language. Active Record is native to Rails and accessible for immediate use once an object has been saved to the database. 

#### Controller

- What is a controller?
  - A controller is the middleman between the model(the data) and the view. It makes the data available to the view and it allows updating and saving data into existing models.

  - A controller is a Ruby class which is inherited from *ApplicationController*. 

  - ##### ACTIONS

    - Actions are embedded within controller classes, which correspond to a certain area or CRUD operations in respect to a certain resource
- How do you create a controller?
  - Controllers are created via the rails generate controller method on the command-line
  -  Or, they can be generate via a migration, and creating a controller file in the appropriate controller directory, with the correct naming conventions.
- How to respond to different data format?

  - In order to respond to different data formats, you should know what sort of data is flowing in, and what typre of data you want to format your response in. From HTML, to JSON, and other data types.

#### Routing

- How to map a URL to a controller action?
  - Mapping a URL involves getting the ControllerClass which has the action you want to invoke upon the route being hit with a request.
    - First: in the config/routes.rb, add the HTTP action followed by the corresponding route which should be hit. add "===>" then, append 'controller#action'
    - HTTP_ACTION 'end-point' ===> 'controller#action'
- How to control who can access the controller action (eg: admin only actions)?
  - One way of controlling who can access the controller action is within the controller, running actions before all controller actions to check if the current user has the correct permissions

#### Other topic:

- Background jobs
- Rake tasks

#### Compare RoR to Javascript Node+Express

