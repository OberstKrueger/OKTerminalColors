/*

 ANSI terminal codes referenced from https://invisible-island.net/xterm/ctlseqs/ctlseqs.html

 */

private let beginCode: String = "\u{001b}["
private let endCode: String   = "\u{001b}[0m"

public enum ForegroundColor: UInt8 {
    case black      = 30
    case red        = 31
    case green      = 32
    case yellow     = 33
    case blue       = 34
    case magenta    = 35
    case cyan       = 36
    case white      = 37
}

public enum BackgroundColor: UInt8 {
    case black      = 40
    case red        = 41
    case green      = 42
    case yellow     = 43
    case blue       = 44
    case magenta    = 45
    case cyan       = 46
    case white      = 47
}

public enum TerminalStyle: UInt8 {
    case normal     = 0
    case bold       = 1
    case dim        = 2
    case italic     = 3
    case underline  = 4
    case blink      = 5
    case reverse    = 7
    case conceal    = 8
    case strike     = 9
}

public extension String {
    /// Prints String in the provided color.
    /// - parameters:
    ///     - color: The foreground color.
    func color(_ color: ForegroundColor) -> String { return "\(beginCode)\(color.rawValue)m\(self)\(endCode)" }

    /// Prints String with provided color as background.
    /// - parameters:
    ///     - color: The background color.
    func background(_ color: BackgroundColor) -> String { return "\(beginCode)\(color.rawValue)m\(self)\(endCode)" }

    /// Prints String with the provided style(s).
    /// - parameters:
    ///     - styles: One or more terminal styles to apply.
    /// - Note: Styles .normal and .bold are contradictory. If both are provided, the first one entered will display.
    func style(_ styles: TerminalStyle...) -> String {
        return styles.count == 0 ? self : "\(styles.map({"\(beginCode)\($0.rawValue)m"}).joined())\(self)\(endCode)"
    }
}
