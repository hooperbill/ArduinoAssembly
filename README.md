# ArduinoAssembly
Example Arduino assembly projects for the AVR processor family. These are projects from my Computer Architecture and Assembly Language class
and some are based on the Sparkfun Tinker Kit activity guide. More information about the Tinker Kit is found here https://learn.sparkfun.com/tutorials/tinker-kit-circuit-guide.

So why use assembly language when the C language can do everything that we need? The first answer is yes, C can do everything we need and is very easy to use. But writing in assembly language, despite its lower-level nature, offers advantages in specific scenarios. A primary reason is the level of control assembly provides over hardware resources. Assembly language allows the programmer to directly manipulate the processor, making it more efficient in terms of execution speed and memory usage compared to high-level languages. This control is important in embedded systems, real-time applications, or when optimizing critical sections of code where every processor cycle counts. Writing in assembly language can result in smaller and more optimized binaries, making it suitable for processors with limited resources. While high-level languages prioritize abstraction and ease of development, assembly language serves a niche where performance and resource efficiency are impplortant, and direct hardware interaction is essential.

As an example, the assembly code to blink a LED is approximately 600 bytes for an AVR processor, where the same program written in C is approximately 900 bytes. For a processor such as the AVR ATTiny85 with 8K of program space that extra 300 bytes is a big deal.

I hope you enjoy these examples and if you have any additional examples please let me know.
