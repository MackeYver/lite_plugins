# Plugins to lite
Plugins to the text editor [lite](https://github.com/rxi/lite) by [rxi](https://github.com/rxi).


## Save all unsaved changes
### saveallunsavedchanges.lua
- Adds alt+s to the keymap
- Iterates through all the files and saves the files that have unsaved changes (is_dirty())
    - If a file exists which has never been saved at all, it will perform the command save-as


## Open header
### openheader.lua
- Adds f8 to the keymap
- If inside a cpp/h file, its h/cpp file will be opened in the next node/view. If the node/view is not split it will split to the right and open it there
- If shift+f8 the cpp/h will be opened in the current active node/view (i.e. toggle between header and source file)


## Move to start of line
### movetostartofline.lue
- Replaces home in the keymap
- Sets the cursor to the starting position of the current line, excluding the first whitespaces of that line, i.e. the cursor is moved to the first non-whitespace character of the line. If the cursor is already at the first non-whitespace character, the cursor will be moved to the start of the line, including all characters (i.e. you can toggle beteen the start of the line and the first non-whitespace character of the line).
