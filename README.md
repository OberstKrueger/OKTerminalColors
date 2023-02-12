# OKTerminalColors

This package allows printing of text to the terminal using standard ANSI escape codes. Foreground color, background color, and text styles are supported.

## Usage

To print text with a specific foreground color, use the following:

```swift
import OKTerminalColors

let text = "Hello world!"

print(text.color(.red))
```

To print text with a specific background color, use the following:

```swift
import OKTerminalColors

let text = "Hello world!"

print(text.background(.yellow))
```

To print text with a specific style, use the following:

```swift
import OKTerminalColors

var text = "Hello world!"

print(text.style(.bold))

text = "Text can have multiple styles too."

print(text.style([.bold, .blink])

```

## ANSI Reference Colors

The following ANSI terminal codes are used, and are referenced from [https://en.wikipedia.org/wiki/ANSI_escape_code](https://en.wikipedia.org/wiki/ANSI_escape_code).

| Style     | Code |
| --------- | ---- |
| Normal    | 0    |
| Bold      | 1    |
| Dim       | 2    |
| Italic    | 3    |
| Underline | 4    |
| Blink     | 5    |
| Reverse   | 7    |
| Coneal    | 8    |
| Strike    | 9    |

| Color   | Foreground | Background |
| ------- | ---------- | ---------- |
| Black   | 30         | 40         |
| Red     | 31         | 41         |
| Green   | 32         | 42         |
| Yellow  | 33         | 43         |
| Blue    | 34         | 44         |
| Magenta | 35         | 45         |
| Cyan    | 36         | 46         |
| White   | 37         | 47         |
