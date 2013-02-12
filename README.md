# MultiSite

[![Build Status](https://travis-ci.org/runtimerevolution/multi_site.png?branch=master)](https://travis-ci.org/runtimerevolution/multi_site)

MultiSite provides the ability to scope your models by tenant.
MultiSite gem is very similar to multi-tenancy gems such as
[acts_as_tenant](https://github.com/ErwinM/acts_as_tenant) but less strict on it's implementation.

## Getting Started

If you need to organize your models by site scope MultiSite is great for that!

# Installation
```ruby
gem 'multi_site'
```
### Main Features of MultiSite:

- provides scopes to fetch records from a specific site
- give you helper methods know what is the current site
- keeps the switch site logic away from your application.

## How to Use MultiSite

### With Your ActiveRecord Models

First, you need to have a class named Site. This is the only constraint you have.

```ruby
class Site < ActiveRecord::Base
  # ...
end
```

In your Models you need to insert the class method `has_site_scope` to declare which ones
are scoped by site:

```ruby
class User < ActiveRecord::Base
  has_site_scope
end

class Card < ActiveRecord::Base
  has_site_scope
end
```

### With Your Controllers
Now on, every model registered has a new scope called `on_site`.
When you call the model User with scope `on_site` it should return all the users
from current site:
```ruby
class UsersController < ApplicationController
  def  index
  	#fetch all the users
  	@all_users = User.all
  	#fetch all the users from current site
  	@site_users = User.on_site
    #fetch all the users from current site with a certain age
    @site_users = User.on_site.where(:age => 15)
  end

end
```
 Instead of scoping the classes to their tenants by default, MultiSite, allows the programmer
 to choose what he wants.

### With Your Routes
MultiSite provides a routing helper to to hide the site handling from you.
```ruby
Application.routes.draw do
   multi_site_scope do
      resources :users
      # this will handle a uri like this:
      # /:multi_site/users/:id
      # and you can use the route helpers transparently
      # e.g. new_user_url, edit_user_path(1), etc
      resources :cards
      # /:multi_site/cards/...
   end
end
```
All the resources inside of multi_site scope will automatically handle the `multi_site`
parameter, and all route helpers will use it transparently.

### With Your Views
MultiSite provides a helper method called `current_site`. It can be used on views or controllers
context and give us the current site selected by the application.
```erb
<% if current_site.present? %>
	<p>Site Name: <%= current_site.name %></p>
<% else %>
	<p> Please you need to <%= link_to "login" "/login" %> first.
<% end %>
```
#### Security
MultiSite doesn't provide any security features. You have the responsability to implement them.
For example, to guarantee that a user doesn't have access to unauthorized tenants, you can
create a before_filter action that checks if the user's site is the same as
current_site:

```ruby

class UsersController < ApplicationController

  before_filter :check_site_access
  #...
  def check_site_access
    unless current_user.site == current_site
      raise "Access Denied"
    end
  end
end
```

#### Threading
MultiSite uses thread context to keep current site id saved for scopes. If you initializate
new threads you need to copy the current site to the new thread in order to keep the
functionality unchanged.

For example:
```ruby
site = current_site
Thread.new {
  MultiSite.current_site = site

  # .. do you work here

  users = User.on_site
  users.map {|u| u.simulate_taxes }
}
```

#RoadMap
- make the site model name customizable

This project rocks and uses MIT-LICENSE.
