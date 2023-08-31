****Prerequisites****
- The setups steps expect following tools installed on the system.
    - Github
    - Ruby 2.7.8
    - Rails 5.2.1

- **Check out the repository**
	``` bash      
	git clone https://github.com/Hafsanajeeb1122/Dinner-Dash.git
	```
- move into directory
    ```bash
    cd ./Dinner-Dash
    ```
- run
    ```bash
    bundle install
    ```
- Create database
  ```bash
  rake db:create
  ```
- ****Create and setup the database****
  - Run the following commands to create and setup the database.
   -   rake db:setup
- ****Start the Rails server****
  - You can start the rails server using the command given below.
    ```
    rails server
    ```
    - Site is available on http://localhost:3000
