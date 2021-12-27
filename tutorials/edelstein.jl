
include("../src/ExactODEReduction.jl")
using .ExactODEReduction

using Catalyst
using DifferentialEquations

import Nemo
using Logging

#=

    http://tellurium.analogmachine.org/wp-content/uploads/2015/08/edelstein1970.pdf


=#

##########################

# edelstein mass action kinetics
parametric = true
if parametric
    R, (ca, cb, cc, theta, beta, gamma, eta, epsilon, rho) = Nemo.PolynomialRing(Nemo.QQ, ["ca", "cb", "cc", "theta", "beta", "gamma", "eta", "epsilon", "rho"])

    dca  = theta*ca - beta*ca^2 - gamma*ca*cb + eta*cc
    dcb  = -gamma*ca*cb + (eta + epsilon)*cc - rho*cb
    dcc  = gamma*ca*cb - (eta + epsilon)*cc + rho*cb
    dtheta = R(0)
    dbeta  = R(0)
    dgamma = R(0)
    deta   = R(0)
    deps   = R(0)
    drho   = R(0)

    system = [
        dca, dcb, dcc, dtheta, dbeta, dgamma, deta, deps, drho
    ]
else
    dca  = theta*ca - beta*ca^2 - gamma*ca*cb + eta*cc
    dcb  = -gamma*ca*cb + (eta + epsilon)*cc - rho*cb
    dcc  = +gamma*ca*cb - (eta + epsilon)*cc + rho*cb
    dtheta = 0
    dbeta  = 0
    dgamma = 0
    deta   = 0
    deps   = 0
    drho   = 0
end


rs = ExactODEReduction.find_reduction(system, loglevel=Logging.Info)

#=
    Unexpectedly
    :new_vars   => [cb + cc, theta, beta, gamma, eta, epsilon, rho]

=#


##########################

# edelstein mass action kinetics
parametric = true
if parametric
    R, (ca, cb, cc, theta, beta, gamma, eta, epsilon, rho) = Nemo.PolynomialRing(Nemo.QQ, ["ca", "cb", "cc", "theta", "beta", "gamma", "eta", "epsilon", "rho"])

    dca  = theta*ca - beta*ca^2 - gamma*ca*cb + eta*cc
    dcb  = -gamma*ca*cb + (eta + 2epsilon)*cc - 2rho*cb^2
    dcc  = gamma*ca*cb - (eta + epsilon)*cc + rho*cb^2
    dtheta = R(0)
    dbeta  = R(0)
    dgamma = R(0)
    deta   = R(0)
    deps   = R(0)
    drho   = R(0)

    system = [
        dca, dcb, dcc, dtheta, dbeta, dgamma, deta, deps, drho
    ]
else
    dca  = theta*ca - beta*ca^2 - gamma*ca*cb + eta*cc
    dcb  = -gamma*ca*cb + (eta + epsilon)*cc - rho*cb
    dcc  = +gamma*ca*cb - (eta + epsilon)*cc + rho*cb
    dtheta = 0
    dbeta  = 0
    dgamma = 0
    deta   = 0
    deps   = 0
    drho   = 0
end


rs = ExactODEReduction.find_reduction(system, loglevel=Logging.Info)

#=
    :new_vars   => [theta, beta, gamma, eta, epsilon, rho]

=#
