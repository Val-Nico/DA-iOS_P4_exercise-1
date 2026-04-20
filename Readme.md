# SwiftUI To-Do List

<img width="200" alt="Screenshot 2023-09-28 at 11 34 13" src="https://github.com/OpenClassrooms-Student-Center/DA-iOS_P4_exercise-1/assets/10169030/cd0884fa-fcf8-4718-b53a-f65626ea89c2">

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Usage](#usage)

### Introduction

This is a simple To-Do List application built using SwiftUI. It allows users to create, manage, and prioritize their tasks easily.

### Features

- **Create Tasks**: Add new tasks with titles.
- **Task Prioritization**: Assign priorities to tasks (Low, Medium, High).
- **Task Completion**: Mark tasks as completed.
- **Task Deletion**: Remove tasks from the list.

### Todo

- **Filtering**: Filter tasks by All, Done, or Not Done status.

### MVVM Architecture (Model - View - ViewModel)

##### View
Responsible of managing the view state. No data/data-logic is handled here.

##### ViewModel
This is where the magic happens. This layer is listening for events from above through Inputs and transform them to Outputs. Thanks to this separation, each layer can communicates with each others without having a tight coupling of responsabilities.

##### Repository (Model)
Responsible of providing Data, by hiding where it comes from. In this project it's basicaly provided by `FileManager` but it could be either from Network etc..

## Getting Started

### Prerequisites

- Xcode 14 or later.
- iOS 16 or later.

### Installation

1. Clone the repository to your local machine:
```shell
git clone https://github.com/OpenClassrooms-Student-Center/DA-iOS_P4_exercise-1.git
```
2. Open the project in Xcode.
3. Build and run the project on your preferred simulator or physical device.
4. Execute the unit tests and see that the filters one are failing 🕵️‍♀️

### Usage

Launch the app and play with it 💪


