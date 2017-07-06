# Build Bridges

### Technologies used:
  1. HTML
  2. CSS
  3. Ruby
  4. sinatra
  5. SQL


### Approach taken:
~ HTML ~
  * Start by writing doctype and linking the HTML file to css and js files
  * The <body> of HTML is broken is 4 parts, <header>, <nav>, <main>, and <footer>
  * Placed 9 <div> encolsed within a <main> to represent the 9 boxes of a tic-tac-toe board
  * Then added <nav> tags on top of the main containing player names and the counters/timer
  * After the <main>, made <footer> which contains all the <buttons>
  * Lastly added <header> to add a title to the page

~ CSS ~
  * Began by setting the body styles: margin to 0 auto and box-sizing to border-box
  * Then aligned the divs to tile next to each other, which required further work on HTML
    adding <br> and comment tags
  * Made sure to clear all other elements after it from floating as well
  * Linked two fonts from google fonts to use for the outlook
  * Added dimensions to align everything within a width of 700px
  * Added features to change color, font-size and margin/padding, text-align
  * After having done basic functions in javascript, added few classes for aesthetic purpose only
    e.g. toggling between two color schemes when an event occurs and ends
  * I tried to make little/no use of ids and claases in css referring to HTML tags

~ Javascript ~
  * Next I declared a counter to help keep count of how many divs are empty
  * Added event listeners to <main> and <buttons>
  * The structure of the js file is as such
      - DOM
      - Variables declaration
      - Functions
      - Event listeners
  * Began by writing DOM, here I stuck to only using tag names and ids
  * Followed by declaring few variables such as counter, to keep track of number of empty divs
  * I added event listeners after that
  * Then I started writing the codes in between event listeners and variables declaration,
    adding functions from bottom to top (that way the functions being called are on top of the functions calling them)
  * Two of the functions were very small, so I kept them enclosed in the event listeners at the very end of the file


### Installation Instruction:
  1. Crate a new repository on personal github  
  2. Add the folder containing the game files (html, css, js) to the repository by
     * Go into the directory of the folder, type `git init` to create an empty git
       repository,
     * Add the origin, `git remote add origin address`
  3. Add and commit the folder, `git add -A` and `git commit -m 'comment'`
  4. Push the my files from local to github repository, `git push origin master`
  5. Finally in the repository, go to Settings -> GitHub Pages -> Source -> set to master branch and save it
  6. Then we can have a url to allow everyone to access the index.html file


### Unsolved problems:
  * Start button is misleading, a better name may be 'Create Profiles'
  * Change the alert on winning, such that users don't need to click ok/enter. It should   
    appear/disaapear on screen to alert the user
  * Allowing users to customize their profile and tokens further
  * Wouls have liked to extend to Strategic tic-tac-toe, which is 9 sets of boxes in another big tac-tac-toe


### How to play:
  * Click on any box to start the game, the first token is fixed as X
  * The highlighted player names indicate whos turn it is
  * The game counter and win counter will count number of games played and winning scores
  * An alert message will show indicating draw
  * After one game played/alert message, the play board will clear without resetting
  * The game can be free-played, without any timer, or profile names
  * Users can select profile names at any time by clicking start button; if left empty it
    will give default names as player 1 and player 2
  * Timed mode allows users to input time in seconds; once entered the button gets
    deactivated
  * The game can be paused and resumed while in timed mode only
  * The game must be reset after a timed mode if user wishes to play again
  * Clicking reset button will reset the entire game, timer, counters, and profile names
