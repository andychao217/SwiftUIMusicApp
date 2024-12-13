//
//  UIExtension.swift
//  SwiftUIMusicApp
//
//  Created by Andy Chao on 2024/11/28.
//
import SwiftUI

// 定义一个枚举来表示不同的字体样式
enum CircularStd: String {
	case regular = "CircularStd-Book"
	case medium = "CircularStd-Medium"
	case bold = "CircularStd-Bold"
	case black = "CircularStd-Black"
}

// 扩展 Font 以便使用自定义字体
extension Font {
	// 自定义字体方法，接受一个 CircularStd 枚举和字体大小
	static func customfont(_ font: CircularStd, fontSize: CGFloat) -> Font {
		custom(font.rawValue, size: fontSize)
	}
}

// 扩展 CGFloat 以提供关于屏幕尺寸和安全区域的便利方法
extension CGFloat {
	// 获取屏幕的宽度
	static var screenWidth: Double {
		return UIScreen.main.bounds.size.width
	}
	// 获取屏幕的高度
	static var screenHeight: Double {
		return UIScreen.main.bounds.size.height
	}
	// 根据比例计算屏幕宽度
	static func widthPer(per: Double) -> Double {
		return screenWidth * per
	}
	// 根据比例计算屏幕高度
	static func heightPer(per: Double) -> Double {
		return screenHeight * per
	}
	// 获取屏幕顶部安全区的 inset
	static var topInsets: Double {
		if let keyWindow = UIApplication.shared.keyWindow {
			return keyWindow.safeAreaInsets.top
		}
		return 0.0
	}
	// 获取屏幕底部安全区的 inset
	static var bottomInsets: Double {
		if let keyWindow = UIApplication.shared.keyWindow {
			return keyWindow.safeAreaInsets.bottom
		}
		return 0.0
	}
	// 获取屏幕左右安全区的 inset
	static var horizontalInsets: Double {
		if let keyWindow = UIApplication.shared.keyWindow {
			return keyWindow.safeAreaInsets.left + keyWindow.safeAreaInsets.right
		}
		return 0.0
	}
	// 获取屏幕上下安全区的 inset
	static var verticalInsets: Double {
		if let keyWindow = UIApplication.shared.keyWindow {
			return keyWindow.safeAreaInsets.top + keyWindow.safeAreaInsets.bottom
		}
		return 0.0
	}
}

// 扩展 Color 以定义应用程序中使用的颜色
extension Color {
	// 定义主色调
	static var primaryApp: Color {
		return Color(hex: "C35BD1")
	}
	
	// 定义焦点颜色
	static var focus: Color {
		return Color(hex: "D9519D")
	}
	
	// 定义未聚焦颜色
	static var unfocused: Color {
		return Color(hex: "63666E")
	}
	
	// 定义焦点开始颜色
	static var focusStart: Color {
		return Color(hex: "ED8770")
	}
	
	// 定义次要颜色的开始和结束颜色
	static var secondaryStart: Color {
		return primaryApp
	}
	
	static var secondaryEnd: Color {
		return Color(hex: "657DDF")
	}
	
	// 定义其他颜色
	static var org: Color {
		return Color(hex: "E1914B")
	}
	
	// 定义主文本颜色
	static var primaryText: Color {
		return Color.white
	}
	
	// 定义不同透明度的主文本颜色
	static var primaryText80: Color {
		return Color.white.opacity(0.8)
	}
	
	static var primaryText60: Color {
		return Color.white.opacity(0.6)
	}
	
	static var primaryText35: Color {
		return Color.white.opacity(0.35)
	}
	
	static var primaryText28: Color {
		return Color.white.opacity(0.28)
	}
	
	static var primaryText10: Color {
		return Color.white.opacity(0.1)
	}
	
	static var secondaryText: Color {
		return Color(hex: "585A66")
	}
	
	// 定义渐变颜色数组
	static var primaryG: [Color] {
		return [focusStart, focus]
	}
	
	static var secondaryG: [Color] {
		return [secondaryStart, secondaryEnd]
	}
	
	// 定义背景颜色
	static var bg: Color {
		return Color(hex: "181B2C")
	}
	
	// 定义深灰色
	static var darkGray: Color {
		return Color(hex: "383B49")
	}
	
	// 定义浅灰色
	static var lightGray: Color {
		return Color(hex: "D0D1D4")
	}
	
	// 自定义初始化方法，根据十六进制字符串创建颜色
	init(hex: String) {
		let hex = hex.trimmingCharacters(in: .alphanumerics.inverted)
		var int: UInt64 = 0
		Scanner(string: hex).scanHexInt64(&int)
		var a, r, g, b: UInt64
		switch hex.count {
		case 3: // RGB(12-bit)
			(a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
		case 6: // RGB(24-bit)
			(a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
		case 8: // ARGB(32-bit)
			(a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
		default:
			(a, r, g, b) = (1, 1, 1, 0)
		}
		
		// 初始化 Color
		self.init(
			.sRGB,
			red: Double(r) / 255,
			green: Double(g) / 255,
			blue: Double(b) / 255,
			opacity: Double(a) / 255
		)
	}
}

extension Color {
	
	func uiColor() -> UIColor {
		
		if #available(iOS 14.0, *) {
			return UIColor(self)
		}
		
		let components = self.components()
		return UIColor(red: components.r, green: components.g, blue: components.b, alpha: components.a)
	}
	
	private func components() -> (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
		
		let scanner = Scanner(string: self.description.trimmingCharacters(in: CharacterSet.alphanumerics.inverted))
		var hexNumber: UInt64 = 0
		var r: CGFloat = 0.0, g: CGFloat = 0.0, b: CGFloat = 0.0, a: CGFloat = 0.0
		
		let result = scanner.scanHexInt64(&hexNumber)
		if result {
			r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
			g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
			b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
			a = CGFloat(hexNumber & 0x000000ff) / 255
		}
		return (r, g, b, a)
	}
}

// 扩展 View 以添加自定义圆角功能
extension View {
	// 添加自定义的圆角处理方法
	func cornerRadius(_ radius: CGFloat, corner: UIRectCorner) -> some View {
		clipShape(RoundedCorner(radius: radius, corner: corner))
	}
}

// 定义一个自定义形状，用于处理圆角
struct RoundedCorner: Shape {
	var radius: CGFloat = .infinity
	var corner: UIRectCorner = .allCorners
	
	// 绘制路径
	func path(in rect: CGRect) -> Path {
		let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: CGSize(width: radius, height: radius))
		return Path(path.cgPath)
	}
}
