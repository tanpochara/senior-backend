using SeniorProject.Service;
using Shouldly;

namespace SeniorProject.UnitTests;

public class Tests
{
    private MathService _mathService;
    [SetUp]
    public void Setup()
    {
        _mathService = new MathService();
    }

    [Test]
    public void Test1()
    {
        _mathService.add(1,3).ShouldBe(4);
    }
}