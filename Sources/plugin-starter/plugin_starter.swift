import OBS
import Foundation

public let PLUGIN_NAME = "starter"
public let PLUGIN_VERSION = "0.0.1"


// TODO: - Document obs module function.

@_cdecl("obs_module_load") 
func obs_module_load() -> Bool {
    print("obs_module_load swift")
    return true
}

@_cdecl("obs_module_unload")
func obs_module_unload() {
    print("obs_module_unload")
}