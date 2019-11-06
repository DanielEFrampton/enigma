# Enigma Project

![alt text](https://upload.wikimedia.org/wikipedia/commons/2/27/Enigma-plugboard.jpg "The Enigma Machine")

## Overview

The *Enigma* project was designed for Turing School of Software and Development to develop my skills with Ruby, OOP, Test-Driven Development, and version control using Github. It implements a simplified version of the Enigma machine and then cracks its encryption, as Alan Turing and his partners did as depicted in *The Imitation Game*.

## Usage

The *Enigma* program can be run from the command line. Clone the repo and navigate to the root directory. To encrypt, use the following syntax, where the first argument is the file containing the text to be encrypted and the second argument is the name of the file to create which will contain the encrypted text.

```
ruby ./lib/encrypt.rb message.txt encrypted.txt
```

To decrypt, use the following syntax, similar to the above but with a third argument which is the random five-digit number used to encrypt the message (take note of it when encrypting) and the fourth argument is the date on which the message was encrypted in DDMMYY format:

```
ruby ./lib/decrypt.rb encrypted.txt decrypted.txt 12345 061119
```

To crack an encrypted message without knowing the key, use the following syntax:

```
ruby ./lib/crack.rb encrypted.txt cracked.txt 061119
```

## Self-Assessment

Upon completion of this project, I was asked to assess my performance based on [this rubric](https://backend.turing.io/module1/projects/enigma/rubric).

|              | Functionality | Object Oriented Programming | Test Driven Development | Version Control |
| ----------- | ----------- | ----------- | ----------- | ----------- |
| Score | 4 | 4 | 4 | 4 |
| Reason | Encrypt, decrypt, and crack methods successfully implemented and command line interfaces implemented for all. | Methods are less than 8 lines each, classes are less than 100 lines long, lines of code are less than 80 characters, two classes utilize class methods extensively, and variable and method names were named carefully for clarity about their purpose. With modifications to the character set, the module could be reused.| Tests were written before code, test coverage is at 100%, test names are specific, and mocks and stubs are used throughout the project. | 15 Pull Requests were made and merged, over 150 commits were made with clear messages and limited to small components of functionality.
