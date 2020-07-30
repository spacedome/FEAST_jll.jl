# Autogenerated wrapper script for FEAST_jll for x86_64-linux-gnu-libgfortran4
export libfeast

using OpenBLAS_jll
## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"
LIBPATH_default = ""

# Relative path to `libfeast`
const libfeast_splitpath = ["lib", "libfeast.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libfeast_path = ""

# libfeast-specific global declaration
# This will be filled out by __init__()
libfeast_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libfeast = "libfeast.so"


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"FEAST")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # From the list of our dependencies, generate a tuple of all the PATH and LIBPATH lists,
    # then append them to our own.
    foreach(p -> append!(PATH_list, p), (OpenBLAS_jll.PATH_list,))
    foreach(p -> append!(LIBPATH_list, p), (OpenBLAS_jll.LIBPATH_list,))

    global libfeast_path = normpath(joinpath(artifact_dir, libfeast_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libfeast_handle = dlopen(libfeast_path)
    push!(LIBPATH_list, dirname(libfeast_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(vcat(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)]), ':')
end  # __init__()

