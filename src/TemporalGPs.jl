module TemporalGPs

    using BlockDiagonals
    using ChainRulesCore
    using Distributions
    using FillArrays
    using LinearAlgebra
    using Random
    using StaticArrays
    using Stheno
    using StructArrays
    using Zygote
    using ZygoteRules

    using FillArrays: AbstractFill
    using Zygote: _pullback

    import Stheno:
        mean,
        cov,
        pairwise,
        logpdf,
        AV,
        AM,
        FiniteGP,
        AbstractGP

    export
        to_sde,
        SArrayStorage,
        ArrayStorage,
        RegularSpacing,
        checkpointed,
        posterior,
        logpdf_and_rand

    # Various bits-and-bobs. Often commiting some type piracy.
    include(joinpath("util", "harmonise.jl"))
    include(joinpath("util", "scan.jl"))
    include(joinpath("util", "zygote_friendly_map.jl"))
    include(joinpath("util", "zygote_rules.jl"))
    include(joinpath("util", "gaussian.jl"))
    include(joinpath("util", "mul.jl"))
    include(joinpath("util", "storage_types.jl"))
    include(joinpath("util", "regular_data.jl"))

    # Linear-Gaussian State Space Models.
    include(joinpath("models", "linear_gaussian_conditionals.jl"))
    include(joinpath("models", "linear_gaussian_state_space_models.jl"))
    include(joinpath("models", "missings.jl"))

    # Converting GPs to Linear-Gaussian SSMs.
    include(joinpath("gp", "lti_sde.jl"))
    include(joinpath("gp", "posterior_lti_sde.jl"))

    # Converting space-time GPs to Linear-Gaussian SSMs.
    include(joinpath("space_time", "rectilinear_grid.jl"))
    include(joinpath("space_time", "regular_in_time.jl"))
    include(joinpath("space_time", "separable_kernel.jl"))
    include(joinpath("space_time", "to_gauss_markov.jl"))
    include(joinpath("space_time", "pseudo_point.jl"))

end # module
