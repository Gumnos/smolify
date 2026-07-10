# smolify
Reduce input text to a small block-print or Braille-dot representation of the data

# Example usage

## Input text:

To demonstrate, here's some common input text:

    $ head jabberwocky.txt
    Jabberwocky
    By Lewis Carroll
    
    'Twas brillig, and the slithy toves
     Did gyre and gimble in the wabe:
    All mimsy were the borogoves,
     And the mome raths outgrabe.
    
    "Beware the Jabberwock, my son!
     The jaws that bite, the claws that catch!

## smolify4:

This uses the block-characters
for a 2-col-to-1-col horizontal compression
and a 2-row-to-1-row vertical compression:

    $ head jabberwocky.txt | smolify4.awk
    █▜██▜▙▄▄
    ▄▄▖▄▄▄▄▗▄▗▄▗▄▄▖▄▄▖
    ▟▛▟█▌█▙▜█▜▟▙█▙▛▀▘
    ▝▀▝▀▝▀▘▀▀▘▀▀▀▀▘
    ▜█▜▙▛▙█▜██▜▙▜▟█▚▄▖▄▄▄

## smolify8:

This uses the Braille-characters
for a 2-col-to-1-col horizontal compression
and a 4-row-to-1-row vertical compression:

    $ head jabberwocky.txt | smolify8.awk
    ⣛⣙⡛⣛⣙⣓⣒⢒⣀⢀⣀⢀⣀⣀⡀⣀⣀⡀
    ⠺⠯⠺⠿⠣⠿⠗⠽⠿⠝⠾⠷⠿⠷⠏⠉⠁
    ⠙⠛⠙⠓⠋⠓⠛⠙⠛⠛⠙⠓⠙⠚⠛⠑⠒⠂⠒⠒⠒

## Why?

I found it helped get an overview of large files,
seeing their structure without getting distracted
by the actual content.
