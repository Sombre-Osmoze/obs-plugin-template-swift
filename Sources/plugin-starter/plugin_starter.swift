import Foundation
import OBS

public let PLUGIN_NAME = "starter"
public let PLUGIN_VERSION = "0.0.1"

// MARK: - OBS_DECLARE_MODULE equivalent

nonisolated(unsafe) public var module: UnsafeMutableRawPointer? = nil

@_cdecl("obs_module_ver")
func obs_module_ver() -> Int32 {
    print("obs_module_ver")
    return LIBOBS_API_MAJOR_VER
}

@_cdecl("obs_module_set_pointer")
func obs_module_set_pointer(_ pointer: UnsafeMutableRawPointer) {
    module = pointer
    print("obs_module_set_pointer")
}

@_cdecl("obs_current_module")
func obs_current_module() {
    print("obs_current_module")
    // return obs_current_module_pointer()
}

// TODO: - Document obs module function

@_cdecl("obs_module_load")
func obs_module_load() -> Bool {
    let result = obs_get_version()
    print("get", result)
    print("version", LIBOBS_API_MAJOR_VER)
    print("obs_module_load")
    ColorSource.register()
    return true
}

@_cdecl("obs_module_unload")
func obs_module_unload() {
    print("obs_module_unload")
    return
}
