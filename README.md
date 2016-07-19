# ElmBase

1. Create the git repo and clone it, then `cd` into the folder.

2. Create the Phoenix app:

    ```sh
    mix phoenix.new .
    ```

    Say yes to everything.

3. Create the database (you'll need PostgreSQL installed):

    ```sh
    mix ecto.create
    ```

4. Start the app to make sure it works:

    ```sh
    mix phoenix.server
    ```

    Point your browser at [http://localhost:4000/](http://localhost:4000/) to see the start page. Verify that everything works.


