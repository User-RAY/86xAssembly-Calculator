# 8086 Assembly Language Calculator

This is a simple calculator program implemented in 8086 Assembly Language. It allows the user to perform various arithmetic and logical operations, including:

- Addition
- Subtraction
- Multiplication
- Division
- AND
- OR
- XOR

The program is designed to interact with the user via a text-based menu system. It takes inputs, performs the selected operation, and displays the result.

## Features

- **Addition**: Adds two numbers. (output upto 9+9=18 double digit)
- **Subtraction**: Subtracts one number from another. (also added that can output negative number -9 to 9)
- **Multiplication**: Multiplies two numbers. (output single digit)
- **Division**: Divides two numbers and returns the quotient and remainder.(also handle error if divisor is zero)
- **AND**: Performs a bitwise AND operation. (output single digit)
- **OR**: Performs a bitwise OR operation. (output single digit)
- **XOR**: Performs a bitwise XOR operation. (output single digit)
- **Exit**: Exits the program.

## Menu Example

The user is presented with the following menu to choose an operation:

```text
Enter an input to perform actions:  
1. Addition
2. Subtraction
3. Multiplication
4. Division
5. AND
6. OR
7. XOR
8. Exit

```

## How to Run the Program in Emu8086

### Write and Save the Code
1. Open Emu8086.
2. Write your assembly code in the editor.
3. Save the code with a `.asm` extension (e.g., `calculator.asm`).

### Step 2: Emulate the Code

1. After writing and saving the assembly code, click the **Emulate** button on the **emu8086** toolbar.
   
   - This will compile and run the program directly in the emulator.
   - The **Emulate** button does both the compiling and running of the program in one step, so you don’t have to separately compile and then run it.

2. The program will start running in the emulator window, and the user will be presented with the menu to perform different operations (addition, subtraction, multiplication, etc.).

### Step 3: Interact with the Program

1. Once the program starts running, follow the on-screen prompts to enter numbers and select the operation.
   
   - For example, if you choose **Addition** (Option 1), you will be prompted to enter the two numbers.
   - The result will then be displayed, and you can choose another operation or exit the program.

2. You can repeatedly choose operations until you select the **Exit** option.

---

**Tip**: 
- If the program encounters an error during execution, **emu8086** will show a message at the bottom of the window.
- Make sure to check for any syntax or logical errors in your code if something doesn’t work as expected.


### Explanation of the Code

#### Main Program Loop
- The program enters a loop where the user is prompted to choose an operation from the menu.
- Based on the user’s input, the program jumps to the corresponding operation (e.g., addition, subtraction, etc.) and performs the selected task.
- After each operation, the result is displayed, and the program returns to the main menu.

