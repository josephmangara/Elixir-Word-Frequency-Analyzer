# Word Frequency Analyzer

A simple yet powerful **Word Frequency Analyzer** built in **Elixir**.  
This command-line project reads a text file, analyzes the frequency of each word, and outputs a sorted list of words by occurrence. It is designed to help beginners learn Elixir fundamentals including pattern matching, recursion, modules, file I/O, and map manipulation.

---

## Table of Contents

- [Features](#features)  
- [Prerequisites](#prerequisites)  
- [Installation](#installation)  
- [Usage](#usage)  
- [Project Structure](#project-structure)  
- [Implementation Details](#implementation-details)  
- [Example](#example)  
- [Future Enhancements](#future-enhancements)  

---

## Features

- Read text from any file  
- Normalize text (lowercase, remove punctuation)  
- Count occurrences of each word  
- Sort words by frequency  
- Export results to a file  
- Fully written in idiomatic Elixir

---

## Prerequisites

- Elixir >= 1.19 (installed via `asdf` or `apt`)  
- Erlang/OTP >= 26  
- Terminal/command-line experience  

- Install elixir and erlang in Ubuntu Linux by running the following in terminal:
``` bash
sudo add-apt-repository ppa:rabbitmq/rabbitmq-erlang
sudo apt update
sudo apt install git elixir erlang
```

- For macOS, you can use:
``` bash
brew install elixir
or 
sudo port install elixir
```

- Windows:
- Download and run the Erlang installer from this link. 
- https://www.erlang.org/downloads.html
- Download and run the Elixir installer compatible with your Erlang/OTP version:
- [Elixir 1.19.2 on Erlang 26](https://github.com/elixir-lang/elixir/releases/download/v1.19.2/elixir-otp-26.exe)

[Here's a link on how to install Elixir in other operating systems. (Official elixir documentation)](https://elixir-lang.org/install.html)

Verify your setup:

```bash
elixir -v
erl -version
```
## Installation 
Run the following commands to get started with the project:
- $ git clone https://github.com/josephmangara/word-frequency-analyzer.git
- $ cd word-frequency-analyzer

## Usage 
In the terminal, open the app folder by running: 
- cd word_frequency

Running as a script on the CLI:
``` bash 
elixir lib/word_frequency.ex 
```

Alternatively, you can explore Elixir's interactive shell by running: 
``` bash
iex -S mix
WordFrequency.analyze("lib/sample.txt")
Example output 
 [
  {"elixir", 5},
  {"language", 3},
  {"programming", 2},
  {"is", 2},
  {"fun", 1}
]
```

You can also try out the test cases by running:
``` bash 
mix test
``` 

## How to run the web app
Follow these steps:

    $ cd word_frequency_web

Start the Phoenix app with:

    $ mix phx.server

You can also run your app inside IEx (Interactive Elixir) as:

    $ iex -S mix phx.server

Run this in case you get stuck 
    $ mix deps.get

## Project structure
``` bash
word_frequency/
├── lib/
│   └── word_frequency.ex   # Core logic module
├── test/                   # Unit tests (optional)
├── sample.txt              # Example input file
├── mix.exs                 # Mix project file
└── README.md
```

## Implementation Details

The project is organized around a single module: WordFrequency.

Module Functions

analyze(file_path)
Reads the file, processes text, and returns a sorted word frequency list.

clean_text(text)
Converts text to lowercase and removes all non-alphabetic characters.

split_words(text)
Splits text into a list of words.

count_words(words)
Counts occurrences of each word using Enum.reduce and maps.

sort_by_frequency(word_map)
Sorts the word frequency map in descending order.

## Example
``` bash
Given a file sample.txt:

Elixir is a functional language.
Elixir makes concurrent programming easy.
Elixir is fun!

elixir

WordFrequency.analyze("sample.txt")

Output:
[
  {"elixir", 3},
  {"is", 2},
  {"functional", 1},
  {"language", 1},
  {"makes", 1},
  {"concurrent", 1},
  {"programming", 1},
  {"easy", 1},
  {"fun", 1}
]
```

## Future Enhancements
- CLI interface with OptionParser
- Handle very large files using File.stream!/1
- Real-time analysis of streamed input or user input
- Ignore common stopwords for cleaner frequency counts
