@unix_only begin
    cd(joinpath(dirname(@__FILE__), "src", "fdasrsf"))
    suffix = @osx? "dylib" : "so"
    run(`make SUFFIX=$suffix`)
    cd(joinpath(dirname(@__FILE__), "src", "gropt"))
    suffix = @osx? "dylib" : "so"
    run(`make SUFFIX=$suffix`)
end