## This file autogenerated by BinaryProvider.write_deps_file().
## Do not edit.
##
## Include this file within your main top-level source, and call
## `check_deps()` from within your module's `__init__()` method

if isdefined((@static VERSION < v"0.7.0-DEV.484" ? current_module() : @__MODULE__), :Compat)
    import Compat.Libdl
elseif VERSION >= v"0.7.0-DEV.3382"
    import Libdl
end
const libz = Sys.isapple() ? "/usr/lib/libz.dylib" : "/usr/lib/libz.so"
function check_deps()
    global libz
    if !isfile(libz)
        error("$(libz) does not exist, Please re-run Pkg.build(\"CodecZlib\"), and restart Julia.")
    end

    if Libdl.dlopen_e(libz) in (C_NULL, nothing)
        error("$(libz) cannot be opened, Please re-run Pkg.build(\"CodecZlib\"), and restart Julia.")
    end

end
