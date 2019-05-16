@testset begin
    test_str = """{"x": NaN, "y": Infinity, "z": -Infinity}"""
    @test_throws ErrorException JSON.parse(test_str)
    val = JSON.parse(test_str, allownan=true)
    @test val["x"] === NaN
    @test val["y"] == Inf
    @test val["z"] == -Inf

    @test_throws ErrorException JSON.parse(IOBuffer(test_str))
    val2 = JSON.parse(IOBuffer(test_str), allownan=true)
    @test val2["x"] === NaN
    @test val2["y"] == Inf
    @test val2["z"] == -Inf
end
