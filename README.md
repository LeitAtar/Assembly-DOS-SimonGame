Sure! The issue arises because the emojis at the beginning of the headings affect the automatic generation of anchor links in Markdown. To fix this, we'll add explicit anchor IDs to the headings to ensure the links in the Table of Contents work correctly.

Here's the updated content with fixed anchor links:

---

# 🎮 SIMON - The Classic Memory Game in Assembly! 🕹️

Welcome to the assembly-coded wonderland of **SIMON**! Are you ready to test your memory skills and relive some retro magic? This game isn't just about winning—it's about embracing the pure, unfiltered awesomeness of assembly coding. So grab your virtual joystick, and let’s jump into this nostalgic ride! 🚀✨

---

## 📚 Table of Contents

- [🌟 About the Game](#about-the-game)
- [✨ Features](#features)
- [🔧 Getting Started](#getting-started)
  - [📋 Prerequisites](#prerequisites)
  - [💾 Installation](#installation)
- [🎮 How to Play](#how-to-play)
- [🖼️ Gameplay Preview](#gameplay-preview)
- [🤔 Contributing](#contributing)
- [💄 License](#license)
- [📨 Contact](#contact)

---

## 🌟 About the Game {#about-the-game}

**SIMON** is the classic memory game we all know and love—brought back to life in Assembly language for DOS! 🖥️✨ Your mission, should you choose to accept it, is to remember and repeat increasingly complex sequences of keys. It's more than a game; it's an 8-bit retro party for your brain! 🎉

Think you're up for the challenge? Put your memory to the ultimate test and let's find out! 🧠💪

---

## ✨ Features {#features}

- **Pure Assembly Code**: Forget about fancy high-level programming—this game is made from scratch with the raw magic of assembly! 💻🧤
- **Interactive Gameplay**: Think you have what it takes to follow the sequence? SIMON is here to put you to the test! 🕰️
- **Colorful Interface**: Okay, maybe “colorful” by DOS standards... but hey, it's got character! 🌈😉
- **Sound Effects**: Beeps, boops, and bloops—classic gaming sounds to make you feel right at home! 🔊🎶
- **Retro Vibes**: Immerse yourself in the nostalgia of yesteryear, when floppy disks ruled and graphics were... well, simpler. 😎🕹️

---

## 🔧 Getting Started {#getting-started}

### 📋 Prerequisites {#prerequisites}

To hop into this time machine and play SIMON, you'll need:

- A DOS emulator like [DOSBox](https://www.dosbox.com/). Yep, we're going old-school! 💾
- An assembler like **MASM** or **TASM**. (Gotta get those assembly vibes!) 🔧
- Basic knowledge of how to assemble and run assembly programs. You got this! 💪

### 💾 Installation {#installation}

1. **Clone the Repository**:

   ```bash
   git clone https://github.com/yourusername/simon-assembly-game.git
   ```

   Easy-peasy! 🍋

2. **Assemble the Code**:

   Open your DOS emulator and navigate to the game directory. Time to work your magic! 🦉

   ```bash
   masm simon.asm;
   link simon.obj;
   ```

   Who knew coding could feel so nostalgic? 😌

3. **Run the Game**:

   ```bash
   simon.exe
   ```

   And boom—you’re ready to rock 'n' roll! 🎸

---

## 🎮 How to Play {#how-to-play}

1. **Start the Game**:

   After running `simon.exe`, you'll be greeted by the legendary title screen. Get ready for the ultimate brain workout! 💥

   ![Title_Screen](assets/title_screen.png)

2. **Understand the Keys**:

   - **q** = Green 🌿
   - **w** = Red 🔴
   - **a** = Blue 🔵
   - **s** = Yellow 🌼
   - **ESC** = End Game 😭

3. **Game Mechanics**:

   - **Press ENTER to Start**: And let the fun begin! 🚀
   - **Watch the Sequence**: The game will show you a sequence of keys. Keep those eyes peeled! 👀

     ![Game Sequence Display](assets/game_sequence.png)

   - **Repeat the Sequence**: Got it memorized? Now it's your turn! Tap those keys! ⌨️✨
   - **Progress**: Each round, the sequence gets longer, and your brain gets a bigger workout! How far can you go before your memory says “nope”? 🤯
   - **Victory**: Nailed it? Awesome! Revel in your moment of triumph! 🎉🏆

     ![Victory Screen](assets/victory_screen.png)

   - **Defeat**: Slip up? Don’t worry, it happens to the best of us! Dust yourself off and try again! 💔🕰️

     ![Defeat Screen](assets/defeat_screen.png)

4. **Exit the Game**:

   - Press **ESC** at any time to bow out.
   - After the game ends, press **ENTER** to return to DOS and bask in the glow of your assembly journey. ✨

---

## 🖼️ Gameplay Preview {#gameplay-preview}

Check out the action behind the scenes! 👀🎜

![Assembling and Running the Game](assets/gameplay_preview.png)

---

## 🤔 Contributing {#contributing}

Think you can make SIMON even more awesome? We'd love your help!

- **Report Bugs**: If you spot a glitch, shout it out! 🐛📢
- **Enhance Features**: Have an idea for a new twist? Code it up and submit a pull request! 💡🚀
- **Optimize Code**: Attention, assembly wizards! If you know how to make this faster or cleaner, we want you! 🧝‍♀️✨

---

## 💄 License {#license}

This project is open-source and available under the [MIT License](LICENSE). Feel free to make it your own! 📝💖

---

## 📨 Contact {#contact}

Got questions, want to collaborate, or just feel like saying hi? We're all ears! 👂

- **Email**: dean97531@gmail.com 📧
- **GitHub**: [LeitAtar](https://github.com/LeitAtar) 🌐

---

**Enjoy the game and may your memory be unbeatable!** 🧠🎉

*Happy coding and gaming!* 👾💙

---

**Notes:**

- **Fixed Anchor Links**: Added explicit `{#anchor-name}` to each heading to ensure the anchor links in the Table of Contents work correctly.
- **Updated Image Links**: Replaced the broken image URLs with placeholders like `assets/title_screen.png`. Make sure to place your image files in an `assets` folder and update the paths accordingly.
- **Consistency**: Ensured that all headings and links are consistent and functional.

Feel free to copy this updated content into your README file. If you have any further questions or need additional assistance, don't hesitate to ask!
