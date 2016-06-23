function score(data::Array{Float64,1}) #returns an object with stats about the data
    log(:blue, "scoring algorithm")
    try
        data = map(makeNumb, data)
        scoredData = Dict()
        scoredData["mean"] = mean(data)
        scoredData["median"] = median(data)
        scoredData["min"] = minimum(data)
        scoredData["max"] = maximum(data)
        scoredData["StandDev"] = std(data)
        scoredData["range"] = scoredData["max"] - scoredData["min"]
        log(:green, "finished scoring algorithm")
        return scoredData
    catch e
        log(:magenta, "error in scoring file")
        log(:red, e)
        log(:green, "finished scoring algorithm")
        return "error while scoring"
    end
end

function record(data::Dict) #writes the result of testing to a file, depending on the type of testing
    #we might want some more logic here, whatever
    writeFile("lib/scores/scores.json", JSON.json(data))
end
