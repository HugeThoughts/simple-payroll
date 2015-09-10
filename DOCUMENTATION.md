# NFN Labs PayRoll

This is the **simplest** and **slickest** Markdown editor.  
Just write Markdown and see what it looks like as you type. And convert it to HTML in one click.

## Getting started


### Initial Setup

- I had problem with latest **mysql2** gem and so using old 0.3.11 (compatibility issue ?)

### Database Structure

|      Users      | Employees |  Payslips  |
|-----------------|-----------|------------|
| emp_no          | emp_no    | emp_no     |
| email           | name      | month      |
| password_digest | PAN       | year       |
| 	              | DOJ       | basic      |
|                 | isAdmin   | conveyance |
|                 |           | medical    |
|                 |           | hra        |
|                 |           | bonus      |
|                 |           | lta        |
|                 |           | fuel       |
|                 |           | mobile     |
|                 |           | loan       |
|                 |           | advance    |
|                 |           | tds        |

Markdown table generated using [ASCII Tables](http://ozh.github.io/ascii-tables/)

### Code WorkFlow

#### 1. Authentication

For user authentication I'm using [Devise](https://github.com/plataformatec/devise) gem instead of writing everything from scratch.

- Add ```gem 'devise'``` in Gemfile

- Run ```rails generate devise:install``` to install Devise Generator

- It'll require us to do some manual things (Is it really required ?)

	1. Add it in config/environments/development.rb

		```config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }```

	2. Set root_url in config/routes.rb

	3. Ensure you have flash messages in **application.html.erb**
		```html

       <p class="notice"><%= notice %></p>

       <p class="alert"><%= alert %></p>

		```
- Run ```rails generate devise User``` and ```rake db:migrate``` 

- To generate views for authentication pages ````rails generate devise:views````
