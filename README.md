# 🎮 SIMON - The Classic Memory Game in Assembly! 🕹️

Welcome to the assembly-coded world of **SIMON**! Get ready to challenge your memory and have some retro fun. This isn't just any game; it's built with pure assembly magic. Let's dive in! 🚀

---

## 📖 Table of Contents

- [About the Game](#about-the-game)
- [Features](#features)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [How to Play](#how-to-play)
- [Gameplay Preview](#gameplay-preview)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

---

## 🌟 About the Game

**SIMON** is a classic memory game where players must recall and reproduce a sequence of colors (or in this case, keys). Built entirely in Assembly language for DOS, this game is a nostalgic trip back to the early days of computing. It's not just a game; it's an experience! 🎉

---

## ✨ Features

- **Pure Assembly Code**: No high-level abstractions here—just raw, unfiltered assembly goodness!
- **Interactive Gameplay**: Follow the sequences and test your memory.
- **Colorful Interface**: Well, as colorful as DOS allows! 😉
- **Sound Effects**: Enjoy beeps and boops that accompany your moves.
- **Retro Vibes**: Feel the nostalgia of classic DOS gaming.

---

## 🛠️ Getting Started

### 📋 Prerequisites

To run this game, you'll need:

- A DOS emulator like [DOSBox](https://www.dosbox.com/).
- An assembler like **MASM** or **TASM**.
- Basic knowledge of how to assemble and run assembly programs.

### 💾 Installation

1. **Clone the Repository**:

   ```bash
   git clone https://github.com/yourusername/simon-assembly-game.git
   ```

2. **Assemble the Code**:

   Open your DOS emulator and navigate to the game directory.

   ```bash
   masm simon.asm;
   link simon.obj;
   ```

3. **Run the Game**:

   ```bash
   simon.exe
   ```

---

## 🎮 How to Play

1. **Start the Game**:

   After running `simon.exe`, you'll see the title screen with instructions.

   ![Title Screen](images/title_screen.png)

2. **Understand the Keys**:

   - **q** = Green
   - **w** = Red
   - **a** = Blue
   - **s** = Yellow
   - **ESC** = End Game

3. **Game Mechanics**:

   - **Press ENTER to Start**: Begin your Simon game adventure!
   - **Watch the Sequence**: The game will display a sequence of keys.

     ![Game Sequence Display](images/game_sequence.png)

   - **Repeat the Sequence**: Input the keys in the same order.
   - **Progress**: The sequence gets longer each round. How far can you go?
   - **Victory**: Successfully recall sequences to win.

     ![Victory Screen](images/victory_screen.png)

   - **Defeat**: Inputting the wrong key ends the game.

     ![Defeat Screen](images/defeat_screen.png)

4. **Exit the Game**:

   - Press **ESC** at any time to exit.
   - After the game ends, press **ENTER** to return to DOS.

---

## 🖼️ Gameplay Preview

![Assembling and Running the Game](images/assembling_running.png)

---

## 🤔 Contributing

Want to make this game even better? Here's how you can help:

- **Report Bugs**: Found a glitch? Let us know!
- **Enhance Features**: Got an idea for a new feature? Implement it and submit a pull request.
- **Optimize Code**: Assembly wizards are welcome to optimize and refine the code.

---

## 📄 License

This project is open-source and available under the [MIT License](LICENSE).

---

## 📬 Contact

Have questions or just want to say hi? Reach out!

- **Email**: your.email@example.com
- **GitHub**: [yourusername](https://github.com/yourusername)

---

**Enjoy the game and may the memory be ever in your favor!** 🧠🎉

*Happy coding and gaming!* 👾
