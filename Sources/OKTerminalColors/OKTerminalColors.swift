#if canImport(Darwin)
import Darwin
#elseif canImport(Glibc)
import Glibc
#elseif canImport(Musl)
import Musl
#elseif canImport(ucrt)
import ucrt
#endif

private let beginCode: String = "\u{001b}["
private let endCode: String   = "\u{001b}[0m"

private let istty: Bool = {
    #if canImport(Darwin) || canImport(Glibc) || canImport(Musl)
    return isatty(STDOUT_FILENO) != 0
    #elseif canImport(ucrt)
    return _isatty(1) != 0
    #else
    return false
    #endif
}()

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
    func color(_ color: ForegroundColor) -> String {
        return istty ? "\(beginCode)\(color.rawValue)m\(self)\(endCode)" : self
    }

    /// Prints String with provided color as background.
    /// - parameters:
    ///     - color: The background color.
    func background(_ color: BackgroundColor) -> String {
        return istty ? "\(beginCode)\(color.rawValue)m\(self)\(endCode)" : self
    }

    /// Prints String with the provided style(s).
    /// - parameters:
    ///     - styles: One or more terminal styles to apply.
    func style(_ styles: TerminalStyle...) -> String {
        if istty && !styles.isEmpty {
            let codes = styles.map { String($0.rawValue) }.joined(separator: ";")
            return "\(beginCode)\(codes)m\(self)\(endCode)"
        }

        return self
    }
}
