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
- [License](#license)  

---

## Features

- Read text from any file  
- Normalize text (lowercase, remove punctuation)  
- Count occurrences of each word  
- Sort words by frequency  
- Optional: Export results to a file  
- Fully written in idiomatic Elixir

---

## Prerequisites

- Elixir >= 1.19 (installed via `asdf` or `apt`)  
- Erlang/OTP >= 26  
- Terminal/command-line experience  

Verify your setup:

```bash
elixir -v
erl -version
