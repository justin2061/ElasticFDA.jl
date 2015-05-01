module ElasticFDA

## Requirements
using Grid
using Dierckx
using NLopt
using ProgressMeter
using Distributions
using Winston

export
    smooth_data!,
    smooth_data,
    f_to_srsf,
    optimum_reparam,
    warp_q_gamma,
    qtocurve,
    vert_fPCA,
    horiz_fPCA,
    gauss_model,
    group_warping_bayes,
    pair_warping_bayes,
    elastic_regression,
    elastic_logistic,
    elastic_mlogistic,
    elastic_prediction,
    srsf_align,
    align_fPCA,
    trapz,
    warp_q_gamma

unixpath = "../deps/src/fdasrsf/fdasrsf"
winpath = "../deps/bin$WORD_SIZE/fdasrsf"
const libfdasrsf = joinpath(dirname(@__FILE__), @unix? unixpath : winpath)

# Ensure library is available.
if (dlopen_e(libfdasrsf) == C_NULL)
    error("libfdasrsf not properly installed. Run Pkg.build(\"FDAsrsf\")")
end

### source files
include("srsf_funcs.jl")
include("misc_funcs.jl")
include("fPCA.jl")
include("bspline.jl")
include("regression_funcs.jl")
include("dp_bayes.jl")
include("mcmc_align.jl")
include("gauss_model.jl")
include("group_warping_bayes.jl")
include("pair_warping_bayes.jl")
include("regression.jl")
include("regression_funcs.jl")
include("time_warping.jl")

end # module