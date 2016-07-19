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

    Point your browser at [http://localhost:4000/](http://localhost:4000/) to see the start page. Verify that everything works. (s1)

5. Add `elm-brunch`, saving it to devDependencies:

    ```sh
    npm i -D elm-brunch
    ```

6. Create a folder for the Elm files in `web/elm`:

    ```sh
    mkdir web/elm
    ```

7. Then `cd` into it and install the `elm-html` package:

    ```sh
    cd web/elm
    elm package install elm-lang/html
    ```

    Say yes to everything.

8. Create a basic App module in the `web/elm` folder:

    ```sh
    touch App.elm
    ```

    And add a very simple Elm application:

    ```elm
    module App exposing (..)

    import Html exposing (text)

    main =
      text "Elm is in the house!"
    ```

9. In `web/templates/layout/app.html.eex`, delete everything inside the `container` div except the `main` element with its call to render the index template:

    ```html
    <div class="container">

      <main role="main">
        <%= render @view_module, @view_template, assigns %>
      </main>

    </div> <!-- /container -->
    ```

10. Then, replace the contents of the `web/templates/page/index.html.eex` file with a div into which we can render the Elm application:

    ```html
    <div id="app"/>
    ```

11. Add two lines to the bottom of the `web/static/js/app.js` file to grab the `app` div and render the Elm app into it:

    ```js
    const elmDiv = document.querySelector('#app')
    const elmApp = Elm.App.embed(elmDiv)
    ```

12. Update the `brunch-config.js` file to watch the `web/elm` path:

    ```js
    watched: [
      "web/static",
      "test/static",
      "web/elm"
    ],
    ```

    And also to add and configure the `elm-brunch` plugin:

    ```js
    plugins: {
      elmBrunch: {
        elmFolder: "web/elm",
        mainModules: ["App.elm"],
        outputFolder: "../static/vendor"
      },
      babel: {
        // Do not use ES6 compiler in vendor code
        ignore: [/web\/static\/vendor/]
      }
    },
    ```

Now `cd` back to the project root. Restart the server if necessary. If you point your browser to [http://localhost:4000/](http://localhost:4000/), you should see "Elm is in the house".

```sh
cd ../../
mix phoenix.server
```

There's your base Phoenix app with Elm. Note that if we change the `App.elm` file, we see the changes pretty much instantly in the browser. (s2)
