﻿namespace OperatorsExpressionsStatements
{
    using System;

    /// <summary>
    /// Task 16: Write a program that exchanges bits {p, p+1, …, p+k-1} with bits {q, q+1, …, q+k-1} of 
    ///          a given 32-bit unsigned integer. The first and the second sequence of bits may not overlap. 
    /// </summary>
    public class BitsExchangeAdvanced
    {
        public static void Main()
        {
            Console.Title = "Exchange 2 groups of \"k\" bits in a given number";
            uint number = EnterData("Please enter the number to be modified: ");
            int bitCount = (int)EnterData("How many bits are going to be replaced (k): ");
            int firstBitRangeStart = (int)EnterData("Enter the first bits group position (p): ");
            int secondBitRangeStart = (int)EnterData("Enter the second bits group position (q): ");

            // Swap positions if first range is with bigger bit index than second one
            if (firstBitRangeStart > secondBitRangeStart)
            {
                firstBitRangeStart ^= secondBitRangeStart;
                secondBitRangeStart ^= firstBitRangeStart;
                firstBitRangeStart ^= secondBitRangeStart;
            }

            // Checks for overlapping of bit indexes
            if (firstBitRangeStart + bitCount < secondBitRangeStart)
            {
                // Checks for out of range bit indexes
                if (firstBitRangeStart + bitCount > sizeof(uint) || secondBitRangeStart + bitCount > sizeof(uint))
                {
                    Console.ForegroundColor = ConsoleColor.Red;
                    Console.WriteLine("Out of range!");
                }
                else
                {
                    uint result = number;
                    for (int index = 0; index < bitCount; index++)
                    {
                        result = SwapBit(result, firstBitRangeStart + index, secondBitRangeStart + index);
                    }

                    Console.ForegroundColor = ConsoleColor.Green;
                    Console.WriteLine("Original binary number {0} ({1})", Convert.ToString(number, 2).PadLeft(32, '0'), number);
                    Console.WriteLine("Modified binary number {0} ({1})", Convert.ToString(result, 2).PadLeft(32, '0'), result);
                }
            }
            else
            {
                Console.ForegroundColor = ConsoleColor.Red;
                Console.WriteLine("Overlapping!");
            }

            Console.ForegroundColor = ConsoleColor.White;
            Console.ReadKey();
        }

        private static uint EnterData(string message)
        {
            bool isValidInput;
            uint enteredValue;
            do
            {
                Console.ForegroundColor = ConsoleColor.White;
                Console.Write(message);
                Console.ForegroundColor = ConsoleColor.Yellow;
                isValidInput = uint.TryParse(Console.ReadLine(), out enteredValue);
                if (!isValidInput)
                {
                    Console.ForegroundColor = ConsoleColor.Red;
                    Console.WriteLine("You have entered invalid number! Try again <press any key...>");
                    Console.ForegroundColor = ConsoleColor.White;
                    Console.ReadKey();
                    Console.Clear();
                }
            }
            while (!isValidInput);

            Console.ForegroundColor = ConsoleColor.White;
            return enteredValue;
        }

        private static uint SwapBit(uint number, int bitOnePosition, int bitTwoPosition)
        {
            uint result = number;

            // Checks current values of reciprocal bits in both ranges
            bool firstBit = IsBitSet(number, bitOnePosition);
            bool secondBit = IsBitSet(number, bitTwoPosition);

            // Sets bit in first range to the value of reciprocal bit in second range
            switch (firstBit)
            {
                case true:
                    result = SetBit(result, bitTwoPosition);
                    break;
                case false:
                    result = ClearBit(result, bitTwoPosition);
                    break;
            }

            // Sets bit in second range to the value of reciprocal bit in first range
            switch (secondBit)
            {
                case true:
                    result = SetBit(result, bitOnePosition);
                    break;
                case false:
                    result = ClearBit(result, bitOnePosition);
                    break;
            }

            return result;
        }

        /// <summary>
        /// Checks the bit at provided position in a number does it set to one (1).
        /// </summary>
        /// <param name="number">Number to be proccessed.</param>
        /// <param name="bitPosition">Bit position to be checked.</param>
        /// <returns>True if bit is set to one, otherwise returns false.</returns>
        private static bool IsBitSet(uint number, int bitPosition)
        {
            int mask = 1 << bitPosition;
            bool result = (number & mask) >> bitPosition == 1;
            return result;
        }

        /// <summary>
        /// Sets the bit at provided position of a number to one(1).
        /// </summary>
        /// <param name="number">Number to be proccessed.</param>
        /// <param name="bitPosition">Bit position to be set to one.</param>
        /// <returns>Number with the modified bit.</returns>
        private static uint SetBit(uint number, int bitPosition)
        {
            int mask = 1 << bitPosition;
            uint result = number | (uint)mask;
            return result;
        }

        /// <summary>
        /// Sets the bit at provided position of a number to zero(0).
        /// </summary>
        /// <param name="number">Number to be proccessed.</param>
        /// <param name="bitPosition">Bit position to be set to zero.</param>
        /// <returns>Number with the modified bit.</returns>
        private static uint ClearBit(uint number, int bitPosition)
        {
            uint mask = (uint)~(1 << bitPosition);
            uint result = number & mask;
            return result;
        }
    }
}