# 🎮 SIMON - The Classic Memory Game in Assembly! 🕹️

Welcome to the assembly-coded wonderland of **SIMON**! Are you ready to test your memory skills and relive some retro magic? This game isn't just about winning—it's about embracing the pure, unfiltered awesomeness of assembly coding. So grab your virtual joystick, and let’s jump into this nostalgic ride! 🚀✨

---

## 📚 Table of Contents

- [🌟 About the Game](#-about-the-game)
- [✨ Features](#-features)
- [🔧 Getting Started](#-getting-started)
  - [📋 Prerequisites](#-prerequisites)
  - [💾 Installation](#-installation)
- [🎮 How to Play](#-how-to-play)
- [🖼️ Gameplay Preview](#%EF%B8%8F-gameplay-preview)
- [📝 Code Logic](#-code-logic)
- [🤔 Contributing](#-contributing)
- [💄 License](#-license)
- [📨 Contact](#-contact)

---

## 🌟 About the Game

**SIMON** is the classic memory game we all know and love—brought back to life in Assembly language for DOS! 🖥️✨ Your mission, should you choose to accept it, is to remember and repeat increasingly complex sequences of keys. It's more than a game; it's an 8-bit retro party for your brain! 🎉

Think you're up for the challenge? Put your memory to the ultimate test and let's find out! 🧠💪

---

## ✨ Features

- **Pure Assembly Code**: Forget about fancy high-level programming—this game is made from scratch with the raw magic of assembly! 💻🧤
- **Interactive Gameplay**: Think you have what it takes to follow the sequence? SIMON is here to put you to the test! 🕰️
- **Colorful Interface**: Okay, maybe “colorful” by DOS standards... but hey, it's got character! 🌈😉
- **Sound Effects**: Beeps, boops, and bloops—classic gaming sounds to make you feel right at home! 🔊🎶
- **Retro Vibes**: Immerse yourself in the nostalgia of yesteryear, when floppy disks ruled and graphics were... well, simpler. 😎🕹️

---

## 🔧 Getting Started

### 📋 Prerequisites

To hop into this time machine and play SIMON, you'll need:

- A DOS emulator like [DOSBox](https://www.dosbox.com/). Yep, we're going old-school! 💾
- An assembler like **MASM** or **TASM**. (Gotta get those assembly vibes!) 🔧
- Basic knowledge of how to assemble and run assembly programs. You got this! 💪

### 💾 Installation

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

## 🎮 How to Play

1. **Start the Game**:

   After running `simon.exe`, you'll be greeted by the legendary title screen. Get ready for the ultimate brain workout! 💥

    ![Title_Screen](https://github.com/user-attachments/assets/d51e03ba-acb6-40b9-b64e-63d0d2ebd2b1)

2. **Understand the Keys**:

   - **q** = Green 🌿
   - **w** = Red 🔴
   - **a** = Blue 🔵
   - **s** = Yellow 🌼
   - **ESC** = End Game 😭

3. **Game Mechanics**:

   - **Press ENTER to Start**: And let the fun begin! 🚀
   - **Watch the Sequence**: The game will show you a sequence of keys. Keep those eyes peeled! 👀

      ![Game Sequence Display](https://github.com/user-attachments/assets/68e83645-4f5b-450f-883c-b7aac83c0354)

   - **Repeat the Sequence**: Got it memorized? Now it's your turn! Tap those keys! ⌨️✨
   - **Progress**: Each round, the sequence gets longer, and your brain gets a bigger workout! How far can you go before your memory says “nope”? 🤯
   - **Victory**: Nailed it? Awesome! Revel in your moment of triumph! 🎉🏆

      ![Victory Screen](https://github.com/user-attachments/assets/d09ce3bc-ccac-4d4a-92c7-372a14111fb7)

   - **Defeat**: Slip up? Don’t worry, it happens to the best of us! Dust yourself off and try again! 💔🕰️

     ![Defeat Screen](https://github.com/user-attachments/assets/8bcee6f2-5488-4ccb-bad4-2356034d65c4)

4. **Exit the Game**:

   - Press **ESC** at any time to bow out.
   - After the game ends, press **ENTER** to return to DOS and bask in the glow of your assembly journey. ✨

---

## 🖼️ Gameplay Preview

Check out the action behind the scenes! 👀🎮

![Assembling and Running the Game](https://github.com/user-attachments/assets/a813b2bc-2820-4e93-8bcd-4246a02d630c)

---

## 📝 Code Logic

Ever wondered what's happening under the hood of this assembly masterpiece? Let's dive into the code logic and explore how SIMON comes to life! 🔍🧠

### Overview

The game is written in **8086 Assembly language** for DOS, utilizing BIOS and DOS interrupts for screen manipulation, keyboard input, and sound generation. Here's a high-level breakdown of the code structure:

1. **Initialization**: Set up data segments and display the start screen.
2. **Main Game Loop**: Generate and display the sequence, get user input, and check for correctness.
3. **Display Functions**: Handle drawing the game interface and updating the squares.
4. **Sound Functions**: Play tones corresponding to each square.
5. **Utility Functions**: Clear the screen, position the cursor, hide the cursor, etc.

### Key Components

#### 1. Data Segment

Defines messages for display, key mappings, and temporary variables.

```assembly
.data
titleMsg db "SIMON - A MEMORY GAME$", 0Dh, 0Ah, "$"
; ... other messages
keysToMove db 'w', 'a', 'q', 's' ; Key sequence
temp dw 3 ; Sequence length
```

#### 2. Main Procedure

Starts the game by displaying the title and instructions, waits for the player to press ENTER, and then enters the main game loop.

```assembly
main proc
    ; Setup data segment
    mov ax, @data
    mov ds, ax

    ; Display start screen
    call clearScreen
    ; ... display messages

    ; Wait for ENTER key
waitForEnter:
    mov ah, 00h
    int 16h
    cmp al, 0dh
    jne waitForEnter

    ; Start the game
    call clearScreenWithoutBlink
    call cursorHider
    call drawSquares

    ; Main game loop
loopTheGame:
    inc temp ; Increase sequence length
    ; ... display sequence, get user input, check correctness
```

#### 3. Displaying the Sequence

Displays the sequence to the player by lighting up squares and playing corresponding sounds.

```assembly
displayInSeq:
    mov al, [si]
    call PlayAndDraw
    inc si
    inc cx
    cmp cx, temp
    jb displayInSeq
```

#### 4. User Input

Captures the player's input and compares it with the generated sequence.

```assembly
userInputSeq:
    push cx
    mov ah, 07h
    int 21h
    call PlayAndDraw
    cmp al, 1bh ; ESC key to exit
    jne notCancel
    jmp exit

notCancel:
    cmp al, [si]
    jne wrongInput
    inc si
    pop cx
    inc cx
    cmp cx, temp
    jb userInputSeq
```

#### 5. PlayAndDraw Procedure

Handles the logic for updating the display and playing sounds based on the key pressed.

```assembly
PlayAndDraw proc
    push ax
    ; Check which key was pressed and call corresponding functions
    cmp al, 'q'
    jne ifNotGreen
    call newGreen
    mov bx, 5709 ; Sound frequency for green
    call playMusic
    call newGreen2
    jmp incomplete

    ; ... similar blocks for other keys

incomplete:
    pop ax
    ret
PlayAndDraw endp
```

#### 6. Drawing Squares

Functions like `newGreen`, `newGreen2`, `newred`, etc., draw the colored squares on the screen.

```assembly
newGreen proc
    mov bl, 0aah ; Light green color code
    mov dl, 29 ; X-axis
    mov dh, 5 ; Y-axis
    call drawLines
    ret
newGreen endp
```

#### 7. Sound Generation

The `playMusic` procedure plays a tone corresponding to the square's color.

```assembly
playMusic proc
    push cx
    mov al, 10110110B
    out 43H, al
    mov ax, bx
    out 42H, al
    mov al, ah
    out 42H, al
    ; ... wait and stop sound
    pop cx
    ret
playMusic endp
```

#### 8. Utility Procedures

- **clearScreen**: Clears the screen.
- **cursorHider**: Hides the blinking cursor during gameplay.
- **positioningTheCursor**: Positions the cursor at a specific location.
- **printString**: Prints strings to the screen.

### Game Flow

1. **Start Screen**: Displays the title and instructions.
2. **Waiting for Start**: The game waits for the player to press ENTER.
3. **Sequence Display**: Shows the sequence by lighting up squares and playing sounds.
4. **Player Input**: Waits for the player to repeat the sequence.
5. **Checking Input**: Compares the player's input with the sequence.
   - **Correct Input**: If the input matches, the game increases the sequence length and loops back.
   - **Incorrect Input**: Displays the defeat message and exits the game.
6. **End Game**: Upon completion or exit, displays a message and waits for ENTER to return to DOS.

### Notes

- **Sequence Generation**: The sequence is currently static, stored in `keysToMove`. To make it dynamic, you could implement random key selection.
- **Game Loop**: The game attempts to loop indefinitely, increasing the difficulty each time.
- **Sound and Graphics**: Uses low-level BIOS interrupts for sound and graphics, giving it an authentic retro feel.

### Potential Improvements

- **Randomized Sequences**: Implement a random number generator to create unpredictable sequences.
- **Score Tracking**: Keep track of the player's score or highest level reached.
- **Optimized Code**: Refine the assembly code for efficiency and readability.
- **Error Handling**: Add more robust input validation and error messages.

---

Feel free to dive into the code and tinker around! The beauty of assembly is that it gives you complete control over the hardware. Happy coding! 👩‍💻👨‍💻

---

## 🤔 Contributing

Think you can make SIMON even more awesome? We'd love your help!

- **Report Bugs**: If you spot a glitch, shout it out! 🐛📢
- **Enhance Features**: Have an idea for a new twist? Code it up and submit a pull request! 💡🚀
- **Optimize Code**: Attention, assembly wizards! If you know how to make this faster or cleaner, we want you! 🧝‍♀️✨

---

## 💄 License

This project is open-source and available under the [MIT License](LICENSE). Feel free to make it your own! 📝💖

---

## 📨 Contact

Got questions, want to collaborate, or just feel like saying hi? We're all ears! 👂

- **Email**: dean97531@gmail.com 📧
- **GitHub**: [LeitAtar](https://github.com/LeitAtar) 🌐

---

**Enjoy the game and may your memory be unbeatable!** 🧠🎉

*Happy coding and gaming!* 👾💙
