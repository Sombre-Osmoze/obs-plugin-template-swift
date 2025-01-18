
import OBS

extension String {
  var obsString: UnsafePointer<CChar> {
    return self.withCString { $0 }
  }
}

extension StaticString {
  var obsString: UnsafePointer<CChar> {
    return self.withUTF8Buffer { UnsafePointer<CChar>(OpaquePointer($0.baseAddress!)) }
  }
}


public struct ColorSource {

    static let sourceId = "swift-color-source"
 
    func defaultPreset() -> obs_source_info {
        var sourceInfo = obs_source_info()
        sourceInfo.id = "swift-color-source".obsString
        sourceInfo.version = 1
        sourceInfo.type = OBS_SOURCE_TYPE_INPUT
        sourceInfo.output_flags = UInt32(OBS_SOURCE_VIDEO | OBS_SOURCE_CUSTOM_DRAW | OBS_SOURCE_SRGB)
        sourceInfo.icon_type = OBS_ICON_TYPE_COLOR
        // sourceInfo.get_name = "Color Source Swift".obsString
        // sourceInfo.get_properties = Self.getProperties()
        // sourceInfo.get_defaults = Self.getDefaults()
        // sourceInfo.get_width = Self.getWidth()
        // sourceInfo.get_height = Self.getHeight()
        // sourceInfo.create = Self.create()
        // sourceInfo.destroy = Self.destroy()
        // sourceInfo.update = Self.update()
        // sourceInfo.video_render = Self.videoRender()


        return sourceInfo   
    }

    static func register() {

    }

}