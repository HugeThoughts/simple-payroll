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
| isAdmin         | DOJ       | basic      |
|                 |           | conveyance |
|                 |           | medical    |
|                 |           | hra        |
|                 |           | bonus      |
|                 |           | lta        |
|                 |           | fuel       |
|                 |           | mobile     |
|                 |           | loan       |
|                 |           | advance    |
|                 |           | tds        |
