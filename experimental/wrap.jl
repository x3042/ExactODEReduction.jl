
using Primes

function select_prime(p)
    nextprime(p + 1)
end

function modular_reduce(x, p)
    map(c -> mod(c, p), x) 
end

function compute_something(x_p)
    x_p[1] * x_p[2]
end

function modular_reconstruct(y_p, p)
    y_p
end

function is_correct(y, x)
    y == x[1] + x[2] 
end

function compute_something_modular(x)
    p = 3
    y = nothing
    @info "input" x

    while true
        p = select_prime(p)
        @info "selected prime" p

        x_p = modular_reduce(x, p)
        @info "reduced" x_p

        y_p = compute_something(x_p)
        @info "computed" y_p

        y = modular_reconstruct(y_p, p)
        @info "reconstructed" y

        if is_correct(y, x)
            break
        end
        @info "not correct =("
    end

    y
end

macro modular(ex, is_correct=nothing)
    println(ex)
    println(ex.head)
    println(ex.args)
    @assert ex.head === :call
    f, x... = ex.args
    x = Tuple(x)
    quote
        p = 3
        y = nothing
        @info "input x = $($x)"
        while true
            p = select_prime(p);
            @info "selected prime" p
            x_p = modular_reduce($x, p)
            @info "reduced" x_p
    
            y_p = $f(x_p...)
            @info "computed" y_p
    
            y = modular_reconstruct(y_p, p)
            @info "reconstructed" y
    
            if $is_correct === nothing 
                break
            end

            if $is_correct(y, $x)
                break
            end

            @info "not correct =("
        end
        y
    end
end